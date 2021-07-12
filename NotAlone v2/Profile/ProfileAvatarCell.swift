//
//  ProfileTopCell.swift
//  NotAlone v2
//
//  Created by Максим on 08.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class ProfileAvatarCell: UITableViewCell {
    
    static let identifier = "ProfileAvatarCell"
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileAvatarCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .bgBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(with model: User) {
        avatarImageView.image = UIImage(named: model.avatar ?? "")
        avatarImageView.round()
    }
    
}
