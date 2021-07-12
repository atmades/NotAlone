//
//  TopDetailCell.swift
//  NotAlone v2
//
//  Created by Максим on 01.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol TopDetail: class {
    func showOnTneMapPressed()
}

class TopDetailCell: UITableViewCell {

    static let identifier = "TopDetailCell"
    weak var delegateOnMap: TopDetail?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateTimeDirreccionLabel: UILabel!
    @IBOutlet weak var showOnMapButton: ButtonWithIcon!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var contactsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TopDetailCell", bundle: nil)
    }
    
    public func setupCell(with model: Event) {
        avatarImageView.image = UIImage(named: model.avatar)
        nameLabel.text = model.name
        detailLabel.text = model.detail
        
//        Setup Button
        showOnMapButton.backgroundColor = UIColor.white
        showOnMapButton.contentHorizontalAlignment = .left
        showOnMapButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        showOnMapButton.setInsets(forContentPadding: .init(top: 10, left: 16, bottom: 10, right: 0), imageTitlePadding: 24)
        
        let titlleButton = String.titleButtonWithImage.showOnMap.rawValue
        showOnMapButton.setTitle(titlleButton, for: .normal)
        showOnMapButton.setTitleColor(.black, for: .normal)
        showOnMapButton.setImage(UIImage(named: model.marker)?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    fileprivate func setupStyle() {
        backgroundColor = .bgBlue
        detailLabel.textColor = .textype
        detailLabel.setTextWithLineSpacing(label: detailLabel, text: detailLabel.text ?? "Описания нет", lineSpacing: 7)
        contactsLabel.textColor = .textHeaderPuprle
    }
    
    @IBAction func showOnMapPressed(_ sender: UIButton) {
        delegateOnMap?.showOnTneMapPressed()
    }
}
