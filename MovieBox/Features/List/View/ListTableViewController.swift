//
//  ListTableViewController.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

final class ListTableViewController: UITableViewController {

    var presenter: ListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MovieBox"
        self.setupLayout()
        self.loadData()
    }
}

// MARK: - UITableView data source

extension ListTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        return presenter.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.identifier, for: indexPath) as? ListItemTableViewCell else {
            fatalError("Couldn't dequeue \(ListItemTableViewCell.identifier)")
        }

        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        
        let movie = presenter.movies[indexPath.row]
        cell.fillOutlets(with: movie)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        presenter.showMovieDetail(by: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        let moviesPerPage = 20
        let countMovies = presenter.movies.count
        
        if countMovies - 1 == indexPath.row && countMovies % moviesPerPage == 0 {
            presenter.loadMorePopularMovies()
        }
    }
}

// MARK: - Private methods

extension ListTableViewController {
    
    fileprivate func setupLayout() {
        self.tableView.backgroundColor = .customLightGray
        self.tableView.rowHeight = 140
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: ListItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ListItemTableViewCell.identifier)
    }
    
    fileprivate func loadData() {
        
        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        presenter.loadPopularMovies()
    }
}

// MARK: - ViewProtocol methods

extension ListTableViewController: ListViewProtocol {
    
    func showLoading() {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 15, weight: .semibold))
        SVProgressHUD.setForegroundColor(.customDarkGray)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    func reloadTableView() {
        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.tableView.reloadData()
        })
    }
    
    func showAlertError(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
