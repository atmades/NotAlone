//
//  StatusCell.swift
//  NotAlone v2
//
//  Created by Максим on 11.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

class StatusCell: UITableViewCell {
    
    static let identifier = "StatusCell"
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "StatusCell", bundle: nil)
    }
    
    public func setupCell(with status: String) {
        statusLabel.textColor = .white
        switch status {
        case "onModeration":
            backgroundColor = .statusModeration
            statusLabel.text = "На  модерации"
        case "rejected":
            backgroundColor = .statusRejected
            statusLabel.text = "Отклонено"
        case "published":
            backgroundColor = .statusPublished
            statusLabel.text = "Опубликовано"
        case "archived":
            backgroundColor = .statusArchived
            statusLabel.text = "В Архиве"
        default:
            ()
        }
    }
}

enum StatusEventus: String {
    case moderation = "На модерации"
    case rejected = "Отклонен"
    case published = "Опубликовано"
    case archived = "В Архиве"
}
