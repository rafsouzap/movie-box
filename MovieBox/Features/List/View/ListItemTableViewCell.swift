//
//  ListItemTableViewCell.swift
//  MovieBox
//
//  Created by Rafael Souza on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class ListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLayout()
    }
    
    func fillOutlets(with movie: MovieViewData) {
        self.titleLabel.text = movie.title
        self.overviewLabel.text = movie.overview
        self.votesLabel.text = "\(movie.votes)"
        
        let imageUrl = AppEnvironment.imageBaseUrl(width: Int(self.coverImageView.bounds.width)).value.appending(movie.imageUrl)
        
        ImageLoader.shared.imageForUrl(urlString: imageUrl, completion: { image, url in
            guard let image = image else { return }
            self.coverImageView.image = image
        })
    }
}

// MARK: - Private methods

extension ListItemTableViewCell {
    
    fileprivate func setupLayout() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    
        self.containerView.setGlow()
        self.titleLabel.textColor = .customRed
        self.overviewLabel.textColor = .customDarkGray
        self.starImageView.tintColor = .customGray
        self.votesLabel.textColor = .customGray
    }
}
