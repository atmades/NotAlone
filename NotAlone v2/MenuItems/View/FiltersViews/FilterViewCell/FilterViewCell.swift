//
//  FilterViewCell.swift
//  NotAlone v2
//
//  Created by Максим on 19.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol FilterDelegate: AnyObject {
    func selectCategory(sender: FilterViewCell)
}

class FilterViewCell: UITableViewCell {
    
    var isSelectedCell: Bool = false
    
    static let identifier = "FilterViewCell"
    weak var delegate: FilterDelegate?
    
    @IBOutlet weak var iconCategoryImageView: UIImageView!
    @IBOutlet weak var nameCategoryLabel: UILabel!
    @IBOutlet weak var checkBox: CheckBoxButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FilterViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(with item: Category, isSelectedCell: Bool) {
        self.isSelectedCell = isSelectedCell
        
        iconCategoryImageView.image = UIImage(named: item.icon)
        nameCategoryLabel.text = item.name
        backgroundColor = .white
        checkBox.isSelected = isSelectedCell
        
    }
    
    @IBAction func selectCheckBox(_ sender: UIButton) {
        checkBox.selectAnimation(sender) // animation and invers isSender
        delegate?.selectCategory(sender: self)
        isSelectedCell = sender.isSelected
        
    }
}

