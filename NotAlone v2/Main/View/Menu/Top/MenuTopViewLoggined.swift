//
//  MenuTopViewLoggined.swift
//  NotAlone v2
//
//  Created by Максим on 06.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol MenuTopViewLogginedDelegate: AnyObject {
    func didCreateNewEventTap()
    func didToProfileTap()
    func didAvatarTap()
}

class MenuTopViewLoggined: UIView {
    
    // MARK: - Appearance
    weak var delegate: MenuTopViewLogginedDelegate?
    
    //    MARK: - Elements
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.round()
        imageView.image = UIImage(named: "avatarDef")
        imageView.isUserInteractionEnabled = true
        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(avatarPressed(_ :)))
        imageView.addGestureRecognizer(avatarTap)
        return imageView
    }()
    private lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .textHeaderDark
        label.text = "Name LastName"
        label.setTextWithLineSpacing(label: label, text: label.text!, lineSpacing: 6)
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(toProfiletPressed(_:)))
        label.addGestureRecognizer(labelTap)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.text = "Хороший человек"
        label.setTextWithLineSpacing(label: label, text: label.text!, lineSpacing: 6)
        label.textAlignment = .center
        return label
    }()
    
   private lazy var newEventButton: UIButton = {
        let button = MainButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        button.setTitle(String.titleMainButton.newEvent.rawValue, for: .normal)
        button.setupMainColor()
        button.addTarget(self, action: #selector(newEventPressed), for: .touchUpInside)
        return button
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
    
    // MARK: - Actions
    @objc func newEventPressed(_ sender: UIButton) {
        delegate?.didCreateNewEventTap()
    }
    
    @objc func toProfiletPressed(_ sender: UITapGestureRecognizer) {
        delegate?.didToProfileTap()
    }
    
    @objc func avatarPressed(_ sender: UITapGestureRecognizer) {
        delegate?.didAvatarTap()
    }
    
    // MARK: - setup Layout
    private func setupLayout() {
        
        [avatarImageView, nameUserLabel, statusLabel, newEventButton].forEach { (v) in
            addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameUserLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 18),
            nameUserLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameUserLabel.widthAnchor.constraint(equalTo: widthAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameUserLabel.bottomAnchor, constant: 4),
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.widthAnchor.constraint(equalTo: widthAnchor),
            
            newEventButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 24),
            newEventButton.heightAnchor.constraint(equalToConstant: 48),
            newEventButton.widthAnchor.constraint(equalTo: widthAnchor),
            newEventButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
