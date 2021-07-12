//
//  ContactCell.swift
//  NotAlone v2
//
//  Created by Максим on 01.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    static let identifier = "ContactCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ContactCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    open func setupCell(with model: Contact) {
        nameLabel.text = model.name
        phoneLabel.text = model.phone
        emailLabel.text = model.email
    }
}

