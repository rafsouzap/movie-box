//
//  ListTableViewController.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class ListTableViewController: UITableViewController {

    var presenter: ListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupLayout()
    }
}

// MARK: - UITableView data source

extension ListTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.backgroundColor = .clear
        return cell
    }
}

// MARK: - Private methods

extension ListTableViewController {
    
    fileprivate func setupLayout() {
        self.tableView.backgroundColor = .lightenGray
        self.tableView.rowHeight = 130
    }
}

// MARK: - ViewProtocol methods

extension ListTableViewController: ListViewProtocol {
    
}
