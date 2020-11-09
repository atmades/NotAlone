//
//  ButtonWithIcon.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

@IBDesignable

class ButtonWithIcon: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)

    }
  
    func setupWithEnum(with button: ButtonsWithIconEnum){
        backgroundColor = UIColor.white
        layer.cornerRadius = 6
        
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        setInsets(forContentPadding: .init(top: 10, left: 0, bottom: 10, right: 0), imageTitlePadding: 10)

        switch button {
        case .vkontakte:
            setTitle("Vkontakte", for: .normal)
            setTitleColor(.vkontakte, for: .normal)
            setImage(UIImage(named: "iconVK"), for: .normal)
        case .facebook:
            setTitle("Facebook", for: .normal)
            setTitleColor(.facebook, for: .normal)
            setImage(UIImage(named: "iconFb"), for: .normal)
        }
    }
}

enum ButtonsWithIconEnum {
    case vkontakte
    case facebook
}
