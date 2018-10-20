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
    
    var genres: [Genre]
    var movies: [Movie]
    private let presenter: MoviesListPresenter
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        movies = []
        genres = []
        presenter = MoviesListPresenter(movieService: MovieNetwork(), genreService: GenreNetwork())
        super.init(coder: aDecoder)
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPresenter()
    }
    
    //    MARK: - Setup
    private func setupPresenter() {
        presenter.attachView(view: self)
        presenter.loadGenres()
    }
    
    private func setupTableView() {
        if let tbv = moviesTableView {
            tbv.register(UINib(nibName: MovieListCell.className, bundle: nil), forCellReuseIdentifier: MovieListCell.className)
            tbv.delegate = self
            tbv.dataSource = self
            tbv.tableFooterView = UIView()
        }
    }
    
    //    MARK: - Action
    @IBAction func genresButtonTouched(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        if let genresVC = st.instantiateViewController(withIdentifier: GenresListViewController.className) as? GenresListViewController {
            genresVC.setupGenres(genres: genres)
            genresVC.delegate = self
            navigationController?.presentInNavigation(vc: genresVC, completion: nil)
        }
    }
}

extension MoviesListViewController: MoviesListView {
    func setupMovies(movies: [Movie]) {
        self.movies = movies
        
        moviesTableView?.reloadData()
        moviesTableView?.layoutIfNeeded()
    }
    
    func setupGenres(genres: [Genre]) {
        self.genres = genres
        
        if let firstGenre = genres.first {
            presenter.loadMovies(for: firstGenre)
        }
    }
}

extension MoviesListViewController: GenresListDelegate {
    func didSelectGenre(genre: Genre) {
        presenter.loadMovies(for: genre)
    }
}

extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.className, for: indexPath) as? MovieListCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        cell.setupMovie(movie: movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
