//
//  MainButton.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

//@IBDesignable
class MainButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupMainColor() {
        backgroundColor = UIColor(named: String.colors.primary.rawValue)
        layer.cornerRadius = 6
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        letterSpace = 0
    }
    
    func setupMainWhite() {
        let primaryColor = UIColor(named: String.colors.primary.rawValue)
        backgroundColor = UIColor.white
        layer.cornerRadius = 0
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: String.colors.divider.rawValue)?.cgColor
        
        setTitleColor(primaryColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        letterSpace = 0
        
    }  
}
