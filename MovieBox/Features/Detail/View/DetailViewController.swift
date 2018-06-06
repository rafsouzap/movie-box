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
    var movieId: Int?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerPosterView: UIView!
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    @IBOutlet weak var genreValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
}

// MARK: - Private methods

extension DetailViewController {
    
    fileprivate func setupLayout() {
        self.containerView.backgroundColor = .customLightGray
        self.containerView.alpha = 0
        self.containerPosterView.setGlow()
        self.titleLabel.textColor = .customDarkGray
        self.overviewLabel.textColor = .customDarkGray
    }
    
    fileprivate func loadData() {
        
        guard let presenter = self.presenter else {
            fatalError("Presenter cannot be nil")
        }
        guard let movieId = self.movieId else {
            fatalError("MovieId cannot be nil")
        }
        presenter.loadMovieDetail(with: movieId)
    }
}

// MARK: - ViewProtocol methods

extension DetailViewController: DetailViewProtocol {
    
    func showLoading() {
        SVProgressHUD.show(withStatus: "Loading...")
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 15, weight: .semibold))
        SVProgressHUD.setForegroundColor(.customDarkGray)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    func setMovieDetail(with movie: MovieDetailViewData) {
        
        self.titleLabel.text = movie.title
        self.overviewLabel.text = movie.overview
        self.releaseDateLabel.text = movie.releaseDate
        self.scoreValueLabel.text = "\(movie.score)"
        self.genreValueLabel.text = movie.genres

        let posterUrl = AppEnvironment.imageBaseUrl(width: Int(self.posterImageView.bounds.width)).value.appending(movie.posterImageUrl)
        let backdropUrl = AppEnvironment.imageBaseUrl(width: 500).value.appending(movie.backdropImageUrl)

        ImageLoader.shared.imageForUrl(urlString: posterUrl, completion: { image, url in
            guard let image = image else { return }
            self.posterImageView.image = image
        })

        ImageLoader.shared.imageForUrl(urlString: backdropUrl, completion: { image, url in
            guard let image = image else { return }
            self.backdropImageView.image = image
        })
        
        UIView.transition(with: self.containerView, duration: 0.35, options: .transitionCrossDissolve, animations: {
            self.containerView.alpha = 1
        })
    }
    
    func showAlertError(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
