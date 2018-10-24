//
//  MovieCrewCellBuider.swift
//  Movies
//
//  Created by Andre Lucas Ota on 10/23/18.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class MovieCrewCellBuider: TableViewCellBuilder {
    let tableView: UITableView
    let crewMembers: [CrewMember]
    
    init(tableView: UITableView, crewMembers: [CrewMember]) {
        self.tableView = tableView
        self.crewMembers = crewMembers
    }
    
    func registerCellAtTableView() {
        tableView.register(UINib(nibName: MovieCrewCell.className, bundle: nil), forCellReuseIdentifier: MovieCrewCell.className)
    }
    
    func cellForRowAtIndexPath(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCrewCell.className, for: indexPath) as? MovieCrewCell else {
            return UITableViewCell()
        }
        
        cell.setupCrewMembers(crewMembers: crewMembers)
        cell.bounds = CGRect(x: 0, y: 0, width: cell.bounds.width, height: 1000)
        
        return cell
    }
    
    func heightForCell() -> CGFloat {
        return UITableView.automaticDimension
    }
}
