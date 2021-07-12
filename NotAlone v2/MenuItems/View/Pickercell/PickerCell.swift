//
//  PickerCell.swift
//  NotAlone v2
//
//  Created by Максим on 03.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol PickerCellDelegate: class {
    func pickerButtonPressed(sender: PickerCell)
}

class PickerCell: UITableViewCell {
    
    static let identifier = "PickerCell"
    weak var delegate: PickerCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerButton: UIButton!
    
    static func nib() -> UINib {
        return UINib(nibName: "PickerCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCell(title: String) {
        titleLabel.text = title
        
        titleLabel.textColor = UIColor.textHeaderDark
        pickerButton.backgroundColor = UIColor.white
        pickerButton.contentHorizontalAlignment = .left
        pickerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)

        pickerButton.setTitleColor(.textHeaderDark, for: .normal)
        pickerButton.setTitleColor(.gray, for: .disabled)
    }
    
    @IBAction func pickerButtonPressed(_ sender: UIButton) {
        delegate?.pickerButtonPressed(sender: self)
    }
}
