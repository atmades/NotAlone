//
//  ViewController.swift
//  NotAlone v2
//
//  Created by Максим on 08.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoLabel: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var beginWithoutRegistrationButton: MainButton!
    @IBOutlet weak var vkontakteButton: ButtonWithIcon!
    @IBOutlet weak var facebookButton: ButtonWithIcon!
    
    var viewModal: AutorizationViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModal = AutorizationViewModel()
        
        view.backgroundColor = UIColor.bgBlue
        logoLabel.round()
        headerLabel.textColor = .headerPuprle
        
        beginWithoutRegistrationButton.setup(title: "Начать без регистрации")
        vkontakteButton.setupWithEnum(with: .vkontakte)
        facebookButton.setupWithEnum(with: .facebook)
    }


}

