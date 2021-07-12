//
//  showingInfoView.swift
//  NotAlone v2
//
//  Created by Максим on 17.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ShowingInfoView: UIView {
    
    let pagging: CGFloat = 16
    
    //    MARK: - Elements

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.text = "1"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkText
        label.textAlignment = .left
        label.text = "1"
        return label
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
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
    
    //    MARK: - Public Func
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
    
//    Add  line down View
    public func addshape(heightOfView: CGFloat) {
        let y = heightOfView - 1
        let fromX = pagging
        let toX: CGFloat = UIScreen.main.bounds.width - pagging
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: fromX, y: y))
        path.addLine(to: CGPoint(x: toX, y: y))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 1
        self.layer.addSublayer(shapeLayer)
    }
    
    //    MARK: - Private Func
    
   fileprivate func setupLayout() {
        
        [headerLabel, contentLabel, placeholderLabel].forEach { (v) in
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
        }
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pagging),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -pagging),
            
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pagging),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: pagging),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            placeholderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: pagging),
            placeholderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: pagging),
            placeholderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
