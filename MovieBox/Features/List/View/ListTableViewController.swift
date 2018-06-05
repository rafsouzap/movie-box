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
        self.title = "MovieBox"
        self.setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - UITableView data source

extension ListTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.identifier, for: indexPath) as? ListItemTableViewCell else {
            fatalError("Couldn't dequeue \(ListItemTableViewCell.identifier)")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("==> didSelectRowAt \(indexPath.row)")
    }
}

// MARK: - Private methods

extension ListTableViewController {
    
    fileprivate func setupLayout() {
        self.tableView.backgroundColor = .customLightGray
        self.tableView.rowHeight = 140
        self.tableView.separatorStyle = .none
        self.tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: ListItemTableViewCell.identifier)
    }
}

// MARK: - ViewProtocol methods

extension ListTableViewController: ListViewProtocol {
    
}
