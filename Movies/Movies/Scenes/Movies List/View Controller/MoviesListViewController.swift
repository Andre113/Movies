//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    @IBOutlet private weak var moviesTableView: UITableView?
    
    var movies: [Movie]
    private let presenter: MoviesListPresenter
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        movies = []
        presenter = MoviesListPresenter(movieService: MovieNetwork())
        super.init(coder: aDecoder)
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPresenter()
    }
    
    //    MARK: - Setup
    func setupPresenter() {
        presenter.attachView(view: self)
        presenter.loadMovies(for: Genre())
    }
    
    func setupTableView() {
        if let tbv = moviesTableView {
            tbv.register(UINib(nibName: MovieListCell.className, bundle: nil), forCellReuseIdentifier: MovieListCell.className)
            tbv.delegate = self
            tbv.dataSource = self
            tbv.tableFooterView = UIView()
        }
    }
}

extension MoviesListViewController: MoviesListView {
    func setupMovies(movies: [Movie]) {
        self.movies = movies
        
        moviesTableView?.reloadData()
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.className, for: indexPath) as? MovieListCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
