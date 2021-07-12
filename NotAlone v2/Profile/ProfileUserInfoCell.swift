//
//  ProfileUserInfoCell.swift
//  NotAlone v2
//
//  Created by Максим on 09.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ProfileUserInfoCell: UITableViewCell {
    
    static let identifier = "ProfileUserInfoCell"

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var placeholderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileUserInfoCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(header: String, content: String?, placeholder: String ) {
        if let content = content {
            contentLabel.isHidden = false
            headerLabel.isHidden = false
            placeholderLabel.isHidden = true
            contentLabel.text = content
            headerLabel.text = header
        } else {
            contentLabel.isHidden = true
            headerLabel.isHidden = true
            placeholderLabel.isHidden = false
            placeholderLabel.text = placeholder
        }
    }
}
