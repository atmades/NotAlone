//
//  EmptyListEventsCell.swift
//  NotAlone v2
//
//  Created by Максим on 10.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class EmptyListEventsCell: UITableViewCell {
    
    static let identifier = "EmptyListEventsCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib {
        return UINib(nibName: "EmptyListEventsCell", bundle: nil)
    }
    
}
