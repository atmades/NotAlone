//
//  ListViewCell.swift
//  SegmentController v5
//
//  Created by Максим on 10.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    static let identifier = "ListViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView! {
        didSet {
            detailTextView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanseLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ListViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(model: Event){
        nameLabel.text = model.name
        detailTextView.text = model.detail
        avatarImageView.image = UIImage(named: model.avatar)
        categoryImageView.image = UIImage(named: model.categoryImage)
        
        monthLabel.textColor = .primary
        dateLabel.textColor = .primary
        directionLabel.text = model.direction
        statusImageView.isHidden = true
    }
    
    func setupCellforUser(model: Event){
        nameLabel.text = model.name
        detailTextView.text = model.detail
        avatarImageView.image = UIImage(named: model.avatar)
        categoryImageView.image = UIImage(named: model.categoryImage)
        statusImageView.image = UIImage(named: model.status)
        
        monthLabel.textColor = .primary
        dateLabel.textColor = .primary
        directionLabel.text = model.direction
    }
}
