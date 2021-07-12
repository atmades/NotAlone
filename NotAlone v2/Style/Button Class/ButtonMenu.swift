//
//  ButtonMenu.swift
//  NotAlone v2
//
//  Created by Максим on 04.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

//@IBDesignable
class ButtonMenu: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = self.frame.size.width / 2
        setTitleColor(.white, for: .normal)
        setImage(UIImage(named: String.images.menuButton.rawValue)?.withRenderingMode(.alwaysOriginal), for: .normal)
        setInsets(forContentPadding: .init(top: 10, left: 0, bottom: 10, right: 0), imageTitlePadding: 00)
        
        layer.shadowColor = UIColor(named: String.colors.textHeaderPuprle.rawValue)?.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 11
        layer.shadowOpacity = 0.17
    }
}
