//
//  GenresListViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol GenresListDelegate: class {
    func setupGenre(genre: Genre)
}

class GenresListViewController: UIViewController {

    @IBOutlet private weak var genresTableView: UITableView?
    
    private var genres: [Genre]
    private var selectedGenre: Genre?
    private var refreshControl: UIRefreshControl?
    private let presenter: GenresListPresenter
    weak var delegate: GenresListDelegate?
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        genres = []
        refreshControl = nil
        presenter = GenresListPresenter(genreService: GenreNetwork())
        super.init(coder: aDecoder)
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPresenter()
        setupRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let index = genres.firstIndex(where: { $0.id == selectedGenre?.id }) {
            let indexPath = IndexPath(row: index, section: 0)
            genresTableView?.scrollToRow(at: indexPath, at: .middle, animated: false)
        }
    }
    
    //    MARK: - Setup
    func setupGenres(genres: [Genre], selectedGenre: Genre?) {
        self.genres = genres
        self.selectedGenre = selectedGenre
    }
    
    private func setupPresenter() {
        presenter.attachView(view: self)
    }
    
    private func setupTableView() {
        if let tbv = genresTableView {
            tbv.register(UINib(nibName: GenresListCell.className, bundle: nil), forCellReuseIdentifier: GenresListCell.className)
            tbv.delegate = self
            tbv.dataSource = self
            tbv.tableFooterView = UIView()
        }
    }
    
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        
        if let refreshControl = refreshControl {
            refreshControl.addTarget(presenter, action: #selector(presenter.loadGenres), for: UIControl.Event.valueChanged)
            genresTableView?.addSubview(refreshControl)
        }
    }
    
    //    MARK: - Action
    @IBAction func closeButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GenresListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenresListCell.className, for: indexPath) as? GenresListCell else {
            return UITableViewCell()
        }
        
        let genre = genres[indexPath.row]
        cell.setupGenre(genre: genre)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let genre = genres[indexPath.row]
        let selected = selectedGenre?.id == genre.id
        cell.setSelected(selected, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let genre = genres[indexPath.row]
            delegate.setupGenre(genre: genre)
            dismiss(animated: true, completion: nil)
        }
    }
}

extension GenresListViewController: GenresListview {
    func setupGenres(genres: [Genre]) {
        refreshControl?.endRefreshing()
        self.genres = genres
        
        genresTableView?.reloadData()
    }
    
    func showError(error: Error) {
        refreshControl?.finishLoading()
        
        showAlert(message: error.localizedDescription)
    }
}
