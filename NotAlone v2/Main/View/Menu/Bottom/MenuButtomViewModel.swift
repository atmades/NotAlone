//
//  MenuButtomViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 28.01.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

class MenuButtomViewModel  {
    
    let mapMenu: SlideMenu = .map(name: "Карта", icon: "map")
    let filtersMenu: SlideMenu = .filters(name: "Фильтры", icon: "filters")
    let settingsMenu: SlideMenu = .settings(name: "Настройки", icon: "settings")
    
    var itemsMenu: [SlideMenu] = []
}
