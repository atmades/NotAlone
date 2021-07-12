//
//  HeaderListTableViewCell.swift
//  NotAlone v2
//
//  Created by Максим on 15.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class HeaderListViewCell: UITableViewCell {
    
    static let identifier = "HeaderListViewCell"
    
    @IBOutlet weak var headerMyeventsLabel: UILabel! {
        didSet {
            headerMyeventsLabel.text = String.headersUI.myEvents.rawValue
            headerMyeventsLabel.textColor = .textHeaderPuprle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .bgBlue
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderListViewCell", bundle: nil)
    }
    
}
