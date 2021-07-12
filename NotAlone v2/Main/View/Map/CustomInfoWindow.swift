//
//  CustomInfoWindow.swift
//  NotAlone v2
//
//  Created by Максим on 01.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class CustomInfoWindow: UIView {
    //    MARK: - Properties
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.text = "Joy Smidt"
        return label
    }()
    
    lazy var organizatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.text = "Организатор"
        return label
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.round()
        return imageView
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .black
        label.text = "Описание тут должно быть"
        return label
    }()
    
    //    MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 6
        makeShadowed(view: self)
    }
    
    //    MARK: - Setup Views
    
    private func setupLayout() {
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(organizatorLabel)
        self.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 32),
            avatarImageView.heightAnchor.constraint(equalToConstant: 32),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            organizatorLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            organizatorLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            organizatorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            
            detailLabel.leadingAnchor.constraint(equalTo: organizatorLabel.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: organizatorLabel.trailingAnchor),
            detailLabel.topAnchor.constraint(equalTo: organizatorLabel.bottomAnchor, constant: 12),
//            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
}
