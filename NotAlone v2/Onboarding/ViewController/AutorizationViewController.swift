//
//  ViewController.swift
//  NotAlone v2
//
//  Created by Максим on 08.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class AutorizationViewController: UIViewController {

//    MARK: - Outlets
    
    @IBOutlet weak var logoLabel: UIImageView! {
        didSet { logoLabel.round() }
    }
    @IBOutlet weak var headerLabel: UILabel! {
        didSet { headerLabel.textColor = UIColor(named: String.colors.textHeaderPuprle.rawValue) }
    }
    
    @IBOutlet weak var beginWithoutRegistrationButton: MainButton! {
        didSet {
            beginWithoutRegistrationButton.setTitle(
                String.titleMainButton.beginWithoutAutorization.rawValue, for: .normal)
            beginWithoutRegistrationButton.setupMainColor()
        }
    }
    
    @IBOutlet weak var vkontakteButton: ButtonWithIcon! {
        didSet {
            vkontakteButton.setupWithEnum(with: .vkontakte)
        }
    }
    
    @IBOutlet weak var facebookButton: ButtonWithIcon! {
        didSet {
            facebookButton.setupWithEnum(with: .facebook)
        }
    }
    
    //    MARK: - Properties
    
    let viewModel: AutorizationViewModel = AutorizationViewModel()
    
    //    MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.bgBlue
    }
    
    deinit {
        print("DEINIT AutorizationViewController")
    }
    
    
    //    MARK: - IBAction
    
    @IBAction func goingToMain(_sender: UIButton) {
        viewModel.goingToMain(viewController: self)
    }
    
}

