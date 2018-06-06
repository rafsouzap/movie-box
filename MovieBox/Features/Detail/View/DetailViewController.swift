//
//  DetailViewController.swift
//  MovieBox
//
//  Created by Rafael de Paula on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: UIViewController {

    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie Details"
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func showLoading() {
        SVProgressHUD.show(withStatus: "Loading popular movies")
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setBackgroundColor(UIColor.darkGray.withAlphaComponent(0.3))
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 15, weight: .semibold))
        SVProgressHUD.setForegroundColor(.white)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    func reloadTableView() {
        
    }
    
    func showAlertError(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
