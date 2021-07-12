//
//  SwitcherCell.swift
//  NotAlone v2
//
//  Created by Максим on 03.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol SwitcherCelllDelegate: class {
    func pushesSwitcherPressed(sender: SwitcherCell)
}

class SwitcherCell: UITableViewCell {
    
    static let identifier = "SwitcherCell"
    weak var delegate: SwitcherCelllDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    static func nib() -> UINib {
        return UINib(nibName: "SwitcherCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func setupCell(title: String) {
        titleLabel.text = title
        
        titleLabel.textColor = UIColor.textHeaderDark
        switcher.onTintColor = .primary
        switcher.tintColor = .lightGray
        switcher.thumbTintColor = .white

    }
    @IBAction func switcherPressed(_ sender: UISwitch) {
        delegate?.pushesSwitcherPressed(sender: self)
    }
    
}
