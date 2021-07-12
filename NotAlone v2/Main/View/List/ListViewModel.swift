//
//  ListViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 29.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

class ListViewModel {
    
    var events = Event.getData()
    var modelBind = Dynamic([
        Event(name: "Name",
              detail: "Def",
              address: "Def",
              coordinates: (lat: 11.11, lng: 11.11),
              avatar: "ava1",
              categoryImage: "",
              status: "",
              marker: "",
              markerSelected: "",
              direction: "",
              contacts: [Contact(name: "", phone: "", email: "")]
        )
    ])
   
    func setData(){
        modelBind.value = events
    }
}

