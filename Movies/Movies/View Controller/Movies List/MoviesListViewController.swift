//
//  MoviesListViewController.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    private let presenter: MoviesListPresenter
    
    //    MARK: - Obj Lifecycle
    init() {
        presenter = MoviesListPresenter()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        presenter = MoviesListPresenter()
        super.init(coder: aDecoder)
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPresenter()
    }
    
    func setupPresenter() {
        presenter.attachView(view: self)
    }
}

extension MoviesListViewController: MoviesListView {
    
}
