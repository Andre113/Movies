//
//  Presenter.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/20/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import Foundation

/**
 Default Presenter Protocol
 */
protocol Presenter: class {
    associatedtype View
    var view: View? { get set }
    
    func attachView(view: View)
    func dettachView()
}

/*
 Default Presenter Implementation
 */
extension Presenter {
    func attachView(view: View) {
        self.view = view
    }
    
    func dettachView() {
        self.view = nil
    }
}
