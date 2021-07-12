//
//  CheckBoxButton.swift
//  NotAlone v2
//
//  Created by Максим on 16.04.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        enum ButtonState {
            case normal
            case selected
        }
        
        setImage(UIImage(named: String.images.checkBoxOff.rawValue)?.withRenderingMode(.alwaysOriginal), for: .normal)
        setImage(UIImage(named: String.images.checkBoxOn.rawValue)?.withRenderingMode(.alwaysOriginal), for: .selected)
    }
    
    func checkState(isSelected: Bool) {
        if isSelected {
//            self.state = UIState.
        }
    }
    
    func selectAnimation(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
}
