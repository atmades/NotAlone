//
//  MainButton.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

@IBDesignable
class MainButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }
    
    func setup(title: String){
        backgroundColor = UIColor.primary
        layer.cornerRadius = 6
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        letterSpace = 0
    }
}
