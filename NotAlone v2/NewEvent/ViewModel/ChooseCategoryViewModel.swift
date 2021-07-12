//
//  ChooseCategoryViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 05.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

protocol ChooseCategoryViewModel {
    var categories: [Category] { get }
    var selectedCategory: Category? { set get }
    func selectCatagory(_ index: Int)
}

class ChooseCategoryViewModelImpl: ChooseCategoryViewModel {
    func selectCatagory(_ index: Int) {
        selectedCategory = categories[index]
    }
    var categories = Category.getCategories()
    var selectedCategory: Category?
}
