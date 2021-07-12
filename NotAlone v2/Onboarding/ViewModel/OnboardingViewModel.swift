//
//  OnboardingViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 26.11.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

class OnboardingViewModel {
  
//    MARK: - Properties
    
    var slides = OnboardingModel.getData()
    var step = Dynamic(Int())
    
//    MARK: - Actions of Buttons
    
    func nextButtonPressed() {
        if step.value < slides.count-1 {
            step.value += 1
        }
    }
    
    func previewButtonPressed(){
        if step.value > 0 {
            step.value -= 1
         }
    }
    
//    func skipButtonPressed(viewController: UIViewController){
//
//        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "AutorizationViewController") else { return }
//
//        viewController.navigationController?.setupIconBack(viewController: viewController)
//        viewController.navigationController?.pushViewController(secondVC, animated: true)
//    }
}
