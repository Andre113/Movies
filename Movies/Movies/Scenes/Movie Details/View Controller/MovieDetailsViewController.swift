//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet private weak var movieTableView: UITableView?
    
    private let presenter: MovieDetailsPresenter
    private var builders: [TableViewCellBuilder]
    private var movieId: Int?
    private var movie: Movie?
    private var credits: Credits?
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        presenter = MovieDetailsPresenter(movieService: MovieNetwork(),
                                          creditService: CreditNetwork())
        movie = nil
        movieId = nil
        credits = nil
        builders = []
        
        super.init(coder: aDecoder)
    }

    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Venomous.green
        
        setupTableView()
        setupPresenter()
    }
    
    //    MARK: - Setup  
    func setupMovieId(movieId: Int) {
        self.movieId = movieId
    }
    
    private func setupPresenter() {
        presenter.attachView(view: self)
        
        if let movieId = movieId {
            presenter.loadInfoForMovieId(movieId: movieId)
        }
    }
    
    private func setupTableView() {
        movieTableView?.dataSource = self
        movieTableView?.delegate = self
        movieTableView?.tableFooterView = UIView()
    }
    
    private func setupDataSource(tableView: UITableView, movie: Movie, credits: Credits) {
        builders = []
        
        let movieLogoBuilder = MovieLogoCellBuilder(tableView: tableView, movie: movie)
        movieLogoBuilder.registerCellAtTableView()
        builders.append(movieLogoBuilder)
        
        let movieOverviewBuilder = MovieOverviewCellBuilder(tableView: tableView, movie: movie)
        movieOverviewBuilder.registerCellAtTableView()
        builders.append(movieOverviewBuilder)
        
        let movieCrewBuilder = MovieCrewCellBuider(tableView: tableView, crewMembers: credits.crew)
        movieCrewBuilder.registerCellAtTableView()
        builders.append(movieCrewBuilder)
        
        let movieCastBuilder = MovieCastCellBuilder(tableView: tableView, castMembers: credits.cast)
        movieCastBuilder.registerCellAtTableView()
        builders.append(movieCastBuilder)
        
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
    
    //    MARK: - Action
    
}

extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let builder = builders[indexPath.row]
        let cell = builder.cellForRowAtIndexPath(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let builder = builders[indexPath.row]
        
        return builder.heightForCell()
    }
}

extension MovieDetailsViewController: MovieDetailsView {
    func setupInformation(movie: Movie, credits: Credits) {
        self.movie = movie
        self.credits = credits
        
        if let tbv = movieTableView {
            setupDataSource(tableView: tbv, movie: movie, credits: credits)
        }
    }
}
