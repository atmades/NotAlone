//
//  TextField.swift
//  NotAlone v2
//
//  Created by Максим on 11.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class TextFieldCustom: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setup() {
        borderStyle = .none
        textColor = UIColor(named: String.colors.textHeaderDark.rawValue)
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height-2, width: frame.width,  height: 1)
        bottomLine.backgroundColor = UIColor(named: String.colors.primary.rawValue)?.cgColor
        layer.addSublayer(bottomLine)
    }
}
