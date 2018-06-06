//
//  DetailViewProtocol.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol DetailViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlertError(title: String, message: String, buttonTitle: String)
}
