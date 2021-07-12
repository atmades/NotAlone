//
//  UserInfoView.swift
//  NotAlone v2
//
//  Created by Максим on 08.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class UserInfoView: UIView {
    
    //    MARK: - Elements
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.text = "1"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkText
        label.textAlignment = .left
        label.text = "1"
        return label
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkText
        label.alpha = 0.8
        label.textAlignment = .left
        label.text = "1"
        return label
    }()
    
    //    MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Func
    public func setupView(header: String, content: String?, placeholder: String ) {
        if let content = content {
            contentLabel.isHidden = false
            headerLabel.isHidden = false
            placeholderLabel.isHidden = true
            contentLabel.text = content
            headerLabel.text = header
        } else {
            contentLabel.isHidden = true
            headerLabel.isHidden = true
            placeholderLabel.isHidden = false
            placeholderLabel.text = placeholder
        }
    }
    
   fileprivate func setupLayout() {
        
        [headerLabel, contentLabel, placeholderLabel].forEach { (v) in
            addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            
            contentLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            placeholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
    }
}
