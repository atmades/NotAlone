//
//  SettingsCell.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let identifier = "SettingsCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "SettingsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setupCell(with item: Settings) {
        let image = UIImage(named: set(item).icon)
        let name = set(item).name
        
        iconImageView.image = image
        titleLabel.text = name
        titleLabel.textColor = UIColor.textHeaderDark
    }
    
    fileprivate func set(_ item: Settings) -> (name: String, icon: String) {
        switch item {
        case .pushes(let name, let icon):
            return (name,icon)
        case .about(let name, let icon):
            return (name,icon)
        case .legal(let name, let icon):
            return (name,icon)
        case .donate(let name, let icon):
            return (name,icon)
        }
    }
}
