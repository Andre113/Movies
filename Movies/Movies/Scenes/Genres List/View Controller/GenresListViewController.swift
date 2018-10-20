//
//  GenresListViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol GenresListDelegate: class {
    func didSelectGenre(genre: Genre)
}

class GenresListViewController: UIViewController {

    @IBOutlet private weak var genresTableView: UITableView?
    
    private var genres: [Genre]
    private let presenter: GenresListPresenter
    weak var delegate: GenresListDelegate?
    
    //    MARK: - Obj Lifecycle
    required init?(coder aDecoder: NSCoder) {
        genres = []
        presenter = GenresListPresenter(genreService: GenreNetwork())
        super.init(coder: aDecoder)
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupPresenter()
    }
    
    //    MARK: - Setup
    func setupGenres(genres: [Genre]) {
        self.genres = genres
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
        
        cell.setupGenre(genre: genres[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let delegate = delegate {
            let genre = genres[indexPath.row]
            delegate.didSelectGenre(genre: genre)
            dismiss(animated: true, completion: nil)
        }
    }
}

extension GenresListViewController: GenresListview {
    
}
