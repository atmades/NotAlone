//
//  MenuTopView.swift
//  NotAlone v2
//
//  Created by Максим on 28.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class MenuTopView: UIView {
    
    //    MARK: - Elements
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.round()
        imageView.image = UIImage(named: "avatarDef")
        return imageView
    }()
    
    private lazy var labelBelowAvatar: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "Авторизуйтесь, чтобы организовывать свoи события."
        label.setTextWithLineSpacing(label: label, text: label.text!, lineSpacing: 6)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonSocialStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.backgroundColor = .black
        stack.spacing = 10
        
        let subviews = [ButtonsWithIconEnum.vkontakte, ButtonsWithIconEnum.facebook].map { (item) -> UIView in
            let button = ButtonWithIcon(type: .system)
            button.setupMenuSocial(with: item)
            return button
        }
        
        subviews.forEach { (button) in
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    
    //    MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Private Func
    
    fileprivate func setupLayout() {
        
        [avatarImageView, labelBelowAvatar, buttonSocialStack].forEach { (v) in
            addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            labelBelowAvatar.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 18),
            labelBelowAvatar.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelBelowAvatar.widthAnchor.constraint(equalTo: widthAnchor),
            
            buttonSocialStack.topAnchor.constraint(equalTo: labelBelowAvatar.bottomAnchor, constant: 18),
            buttonSocialStack.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
