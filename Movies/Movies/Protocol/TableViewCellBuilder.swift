//
//  TableViewCellBuilder.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

/**
 Protocol to create custom UITableViewCell
 */
protocol TableViewCellBuilder: class {
    var tableView: UITableView { get }
    
    func registerCellAtTableView()
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell
    func heightForCell() -> CGFloat
}
