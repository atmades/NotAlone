//
//  Extension.swift
//  NotAlone v2
//
//  Created by Максим on 08.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation
import UIKit


// MARK: - UIImageView
extension UIImageView {
    func round(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}

// MARK: - UIColor
extension UIColor {
//    Base Colors
    static let primary = UIColor(displayP3Red: 252/255, green: 73/255, blue: 47/255, alpha: 1.0)
    static let bgBlue = UIColor(displayP3Red: 247/255, green: 249/255, blue: 254/255, alpha: 1.0)
    
//    Text Colors
    static let headerPuprle = UIColor(displayP3Red: 63/255, green: 33/255, blue: 125/255, alpha: 1.0)
    static let textype = UIColor(displayP3Red: 11/255, green: 11/255, blue: 11/255, alpha: 1.0)
    static let headerdark = UIColor(displayP3Red: 75/255, green: 65/255, blue: 90/255, alpha: 1.0)
    
    static let vkontakte = UIColor(displayP3Red: 75/255, green: 120/255, blue: 170/255, alpha: 1.0)
    static let facebook = UIColor(displayP3Red: 65/255, green: 100/255, blue: 180/255, alpha: 1.0)
}

// MARK: - UILabel

//  Change line spacing
extension UILabel {

    func setTextWithLineSpacing(
        label:UILabel,
        text:String,
        lineSpacing:CGFloat)
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing

        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))

        label.attributedText = attrString
    }
}

// MARK: - UIButton

// Change spasing betweet image and title
extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
}

// Change letter spasing
extension UIButton {

    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedTitle(for: .normal) {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: self.titleLabel?.text ?? "")
                setTitle(.none, for: .normal)
            }

            attributedString.addAttribute(NSAttributedString.Key.kern,
                                           value: newValue,
                                           range: NSRange(location: 0,
                                                          length: attributedString.length))

            setAttributedTitle(attributedString, for: .normal)
        }

        get {
            if let currentLetterSpace = attributedTitle(for: .normal)?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}
