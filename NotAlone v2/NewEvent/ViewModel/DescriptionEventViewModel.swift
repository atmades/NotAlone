//
//  DescriptionEventViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 08.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

protocol DescriptionEventViewModel {
    // MARK: - Properties
    var descriptionText: String? { get }
    var placeholderText: String { get }
    
    // MARK: - Functions
    func didChengeDescription(text: String?)
}

class DescriptionEventViewModelImpl: DescriptionEventViewModel {
    var descriptionText: String?
    var placeholderText = String.placeholders.descriptionEvent.rawValue
    
    func didChengeDescription(text: String?) {
        self.descriptionText = text
    }
    
}
