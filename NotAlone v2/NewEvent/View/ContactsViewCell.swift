//
//  ContactsViewCell.swift
//  NotAlone v2
//
//  Created by Максим on 17.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ContactOfEventCell: UITableViewCell {
    static let identifier = "ContactOfEventCell"
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "ОСНОВНОЙ"
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightActionLabel: UILabel = {
        let label = UILabel()
        label.text = "Использовать мои данные"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .primary
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .bgBlue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 4, leading: 16, bottom: 8, trailing: 16)
        return stackView
    }()
    
    
     lazy var nameView: TextFieldView = {
        let view = TextFieldView()
        view.addshape(heightOfView: 60)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        return view
    }()
    private lazy var phoneView: UIView = {
        let view = TextFieldView()
        view.addshape(heightOfView: 60)
        view.setupView(header: "Phone", placeholder: "Введите имя")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    private lazy var emailView: UIView = {
        let view = TextFieldView()
        view.addshape(heightOfView: 60)
        view.setupView(header: "Email", placeholder: "Введите имя")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
     lazy var inputsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0)
        return stackView
    }()
    
    private lazy var holderInputsView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        
        nameView.setupView(header: "Имя", placeholder: "Введите имя")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
   
    }
    
    func setupLayout() {
        contentView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(headerLabel)
        headerStackView.addArrangedSubview(rightActionLabel)
        
        contentView.addSubview(inputsStackView)
        
//        holderInputsView.addSubview(inputsStackView)
        inputsStackView.addArrangedSubview(nameView)
        inputsStackView.addArrangedSubview(phoneView)
        inputsStackView.addArrangedSubview(emailView)
        
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            headerStackView.heightAnchor.constraint(equalToConstant: 40),
    
            inputsStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 0),
            inputsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            inputsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            inputsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        
    }

}
