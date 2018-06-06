//
//  ListViewProtocol.swift
//  MovieBox
//
//  Created by Rafael de Paula on 04/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol ListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlertError(title: String, message: String, buttonTitle: String)
}
