//
//  HeaderFiltersCell.swift
//  NotAlone v2
//
//  Created by Максим on 17.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class HeaderFiltersCell: UITableViewCell {
    
    static let identifier = "HeaderFiltersCell"

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .bgBlue
        headerLabel.textColor = .textHeaderDark
        subheaderLabel.textColor = .textHeaderDark
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderFiltersCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
