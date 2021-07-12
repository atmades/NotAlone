//
//  TextQuote.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class TextQuote: UILabel {
    
    @IBInspectable var color: UIColor = UIColor(named: String.colors.textype.rawValue) ?? .black
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        textColor = color
//        setTextWithLineSpacing(label: self, text: self.text!, lineSpacing: 4)
//        textAlignment = .center
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setup()

    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setup()
    }

    private func setup() {
        textColor = color
        setTextWithLineSpacing(label: self, text: self.text!, lineSpacing: 4)
        textAlignment = .center
    }
}
