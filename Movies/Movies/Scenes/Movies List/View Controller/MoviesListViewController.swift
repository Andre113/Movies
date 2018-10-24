//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    struct Constants {
        static let initialPage = 1
    }
    
    @IBOutlet private weak var moviesTableView: UITableView?
    
    private var genres: [Genre]
    private var movies: [Movie]
    private var actualPage: Int
    private var actualGenre: Genre?
    private let presenter: MoviesListPresenter
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        movies = []
        genres = []
        actualPage = Constants.initialPage
        actualGenre = nil
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
        goToGenresListViewController()
    }
    
    //    MARK: - Navigation
    func goToGenresListViewController() {
        let st = UIStoryboard(name: "Main", bundle: nil)
        if let genresVC = st.instantiateViewController(withIdentifier: GenresListViewController.className) as? GenresListViewController {
            genresVC.setupGenres(genres: genres, selectedGenre: actualGenre)
            genresVC.delegate = self
            navigationController?.presentInNavigation(vc: genresVC, completion: nil)
        }
    }
    
    func goToMovieDetailsViewController(movie: Movie) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        if let movieVC = st.instantiateViewController(withIdentifier: MovieDetailsViewController.className) as? MovieDetailsViewController {
            movieVC.setupMovieId(movieId: movie.id)
            navigationController?.pushViewController(movieVC, animated: true)
        }
    }
}

extension MoviesListViewController: MoviesListView {
    func setupMovies(movies: [Movie]) {
        self.movies = movies
        
        moviesTableView?.reloadData()
        moviesTableView?.layoutIfNeeded()
    }
    
    func setupMoreMovies(movies: [Movie]) {
        self.movies.append(contentsOf: movies)
        
        moviesTableView?.reloadData()
    }
    
    func setupGenres(genres: [Genre]) {
        self.genres = genres
        
        if let firstGenre = genres.first {
            self.actualGenre = firstGenre
            presenter.loadMovies(for: firstGenre, at: actualPage)
        }
    }
}

extension MoviesListViewController: GenresListDelegate {
    func setupGenre(genre: Genre) {
        if let actualGenre = actualGenre {
            if genre.id == actualGenre.id {
                return
            }
        }
        
        actualGenre = genre
        actualPage = Constants.initialPage
        presenter.loadMovies(for: genre, at: actualPage)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let limitRow = ((actualPage)*20)-6
        
        if indexPath.row == limitRow{
            if let actualGenre = actualGenre {
                actualPage += 1
                presenter.loadMoreMovies(for: actualGenre, at: actualPage)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movie = movies[indexPath.row]
        goToMovieDetailsViewController(movie: movie)
    }
}
