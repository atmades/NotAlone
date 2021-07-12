//
//  ButtonStroke.swift
//  NotAlone v2
//
//  Created by Максим on 27.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
class ButtonStroke: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let colorBg = UIColor(named: String.colors.bgBlue.rawValue)?.withAlphaComponent(0.2)
        let primary = UIColor(named: String.colors.primary.rawValue)
        backgroundColor = colorBg
        layer.cornerRadius = 6
        setTitleColor(primary, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        letterSpace = 0
        layer.borderColor = primary?.cgColor
        layer.borderWidth = 1
    }
}

extension UIButton {
    func setStroke(strokeColor: UIColor, bgColor: UIColor, titleColor: UIColor){
        backgroundColor = bgColor.withAlphaComponent(0.2)
        layer.cornerRadius = 6
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        letterSpace = 0
        layer.borderColor = strokeColor.cgColor
        layer.borderWidth = 1
    }
}
