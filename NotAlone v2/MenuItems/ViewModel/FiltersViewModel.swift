//
//  FiltersViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 13.02.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

protocol FiltersViewModel {
    var categories: [Category] { get }
    var selectedCategoryes: [Category] { set get }
    func changeSelected(category: Category)
    func checkIsSelected(category: Category) -> Bool
}

class FiltersViewModelImpl: FiltersViewModel {
    
    var categories = Category.getCategories()
    var selectedCategoryes: [Category] = []
    
    func checkIsSelected(category: Category)-> Bool {
        for item in selectedCategoryes {
            if category.name == item.name {
                return true
            }
        }
        return false
    }
    
    func changeSelected(category: Category) {
        for (index,value) in selectedCategoryes.enumerated() {
            if category.name == value.name {
                selectedCategoryes.remove(at: index)
                return
            }
        }
        selectedCategoryes.append(category)
    }
}

