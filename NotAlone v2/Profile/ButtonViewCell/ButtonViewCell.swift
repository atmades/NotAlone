//
//  ProfileAdditionalCell.swift
//  NotAlone v2
//
//  Created by Максим on 09.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import UIKit

protocol ButtonCell: class {
    func buttonCellpressed(sender: ButtonViewCell)
}

class ButtonViewCell: UITableViewCell {
    
    static let identifier = "ButtonViewCell"
    weak var delegateButtonCell: ButtonCell?
    
    @IBOutlet weak var logOutButton: MainButton!{
        didSet {
//            logOutButton.setTitle(String.titleMainButton.exit.rawValue, for: .normal)
//            logOutButton.setupMainWhite()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .bgBlue
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ButtonViewCell", bundle: nil)
    }

    @IBAction func logOutButtonPressed(_ sender: MainButton) {
        self.delegateButtonCell?.buttonCellpressed(sender: self)
    }
    
    public func setupMainStyle() {
        logOutButton.setupMainWhite()
    }
    
    public func setupTitle(with title: String) {
        self.logOutButton.setTitle(title, for: .normal)
    }
}
