//
//  AutorizationViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 09.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import UIKit

class AutorizationViewModel {
    
    func goingToMain(viewController: UIViewController) {
        guard let window = viewController.view.window else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        window.rootViewController = storyboard.instantiateViewController(identifier: "MainViewController")
    }
}
