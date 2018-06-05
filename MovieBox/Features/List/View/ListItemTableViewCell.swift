//
//  ListItemTableViewCell.swift
//  MovieBox
//
//  Created by Rafael Souza on 05/06/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit
import SnapKit

final class ListItemTableViewCell: UITableViewCell {

    let viewPadding: CGFloat = 15
    var containerView: UIView!
    var coverImageView: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.containerView = UIView(frame: CGRect.zero)
        self.containerView.backgroundColor = .white
        
        self.coverImageView = UIImageView(frame: CGRect.zero)
        self.coverImageView.backgroundColor = .customGray

        self.containerView.addSubview(self.coverImageView)
        self.contentView.addSubview(self.containerView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Private methods

extension ListItemTableViewCell {
    
    fileprivate func setupLayout() {
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.contentView).offset(viewPadding)
            make.right.equalTo(self.contentView).offset(-viewPadding)
            make.top.equalTo(self.contentView).offset(viewPadding)
            make.bottom.equalTo(self.contentView)
        }
        self.containerView.setGlow()
        
        self.coverImageView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.containerView)
            make.top.equalTo(self.containerView)
            make.bottom.equalTo(self.containerView)
            make.width.equalTo(92)
        }
    }
}
