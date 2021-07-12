//
//  CategoryCell.swift
//  NotAlone v2
//
//  Created by Максим on 05.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var nameCategoryLabel: UILabel!
    @IBOutlet weak var iconCategoryImageView: UIImageView!
    @IBOutlet weak var iconRadioImageView: UIImageView!
    
    private let checked = UIImage(named: "RadioSelected")
    private let unchecked = UIImage(named: "RadioDeselected")
    
    static let identifier = "CategoryCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = UITableViewCell.SelectionStyle.none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func isSelected(_ selected: Bool) {
        setSelected(selected, animated: false)
        let image = selected ? checked : unchecked
        iconRadioImageView.image = image
    }
    
    public func setupCell(with item: Category) {
        iconCategoryImageView.image = UIImage(named: item.icon)
        nameCategoryLabel.text = item.name
        backgroundColor = .white
    }
    
}
