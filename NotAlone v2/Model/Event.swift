//
//  Event.swift
//  NotAlone v2
//
//  Created by Максим on 29.12.2020.
//  Copyright © 2020 Maxim Nikitin. All rights reserved.
//

import Foundation

struct User {
    var name: String?
    var email: String?
    var phone: String?
    var avatar: String?
    var vkontakteLink: String?
    var facebookLink: String?
    var events: [Event]?
    
    static func getUserWithoutEvents() -> User {
        return User(name: "Ирина Николаевна", email: "email@user.com", phone: "+9 000 000", avatar: "ava1", vkontakteLink: "vk.ru", facebookLink: "fb.com", events: nil)
    }
    
    static func getUserAndEvents() -> User {
        return User(name: "Ирина Николаевна",
                    email: "email@user.com",
                    phone: "+9 000 000",
                    avatar: "ava1",
                    vkontakteLink: "vk.ru",
                    facebookLink: "fb.com",
                    events: [
                        Event(name: "Ирина Николаевна",
                              detail: "Компьютерная томография позволяет рассмотреть каждый зуб под любым углом и на разных срезах. Другие рентгеновские аппараты дают изображение только в двух плоскостях, что ведет к наслоению картины и неточным результатам",
                              address: "Москва, Театральная д. 12",
                              coordinates: (lat: 55.757535, lng: 37.6169993),
                              avatar: "ava1",
                              categoryImage: "categoryListAnimal",
                              status: "onModeration",
                              marker: "markerAnimal",
                              markerSelected: "markerSelectedAnimal",
                              direction: "Москва, ул.Тверская, д.12",
                              contacts: [Contact(name: "Jon", phone: "+9 000 000", email: "anna@mail.com"),
                                         Contact(name: "Katy", phone: "+9 123 000", email: "ioan@mail.comm")]
                        ),
                        Event(name: "Ирина Николаевна",
                              detail: "Само исследование проходит комфортно, быстро и безопасно для пациента. Компьютерная томография может проводиться не только на обеих челюстях, но и в области одного проблемного зуба, либо одной челюсти. В этом случае стоимость исследования значительно ниже.",
                              address: "Москва, Театральная д. 12",
                              coordinates: (lat: 54.75672, lng: 38.6179971),
                              avatar: "ava1",
                              categoryImage: "categoryListEco",
                              status: "published",
                              marker: "markerEco",
                              markerSelected: "markerSelectedEco",
                              direction: "Москва, ул.Садовая, д.12",
                              contacts: [Contact(name: "Suzi", phone: "+9 000 000", email: "anna@mail.com"),
                                         Contact(name: "Lulu", phone: "+9 123 000", email: "ioan@mail.comm")]
                        )
                    ]
        )
    }
}


struct Contact {
    var name: String?
    var phone: String?
    var email: String?
    
    static func getMyContact() -> Contact {
        return Contact(name:"John",phone:"12345",  email: "john@mail.com")
    }
}

struct Event {
    var name: String
    var detail: String
    var address: String
    var coordinates: (lat: Double, lng: Double)
    var avatar: String
    var categoryImage: String
    var status: String
    var marker: String
    var markerSelected: String
    var direction: String
    var contacts: [Contact]
    
    static func getData() -> [Event] {
        return [
            Event(name: "Ирина Николаевна",
                  detail: "Компьютерная томография позволяет рассмотреть каждый зуб под любым углом и на разных срезах. Другие рентгеновские аппараты дают изображение только в двух плоскостях, что ведет к наслоению картины и неточным результатам",
                  address: "Москва, Театральная д. 12",
                  coordinates: (lat: 55.757535, lng: 37.6169993),
                  avatar: "ava1",
                  categoryImage: "categoryListAnimal",
                  status: "onModeration",
                  marker: "markerAnimal",
                  markerSelected: "markerSelectedAnimal",
                  direction: "Москва, ул.Тверская, д.12",
                  contacts: [Contact(name: "Jon", phone: "+9 000 000", email: "anna@mail.com"),
                             Contact(name: "Katy", phone: "+9 123 000", email: "ioan@mail.comm")]
            ),
            Event(name: "Василий Иванович",
                  detail: "Само исследование проходит комфортно, быстро и безопасно для пациента. Компьютерная томография может проводиться не только на обеих челюстях, но и в области одного проблемного зуба, либо одной челюсти. В этом случае стоимость исследования значительно ниже.",
                  address: "Москва, Театральная д. 12",
                  coordinates: (lat: 54.75672, lng: 38.6179971),
                  avatar: "ava2",
                  categoryImage: "categoryListEco",
                  status: "published",
                  marker: "markerEco",
                  markerSelected: "markerSelectedEco",
                  direction: "Москва, ул.Садовая, д.12",
                  contacts: [Contact(name: "Suzi", phone: "+9 000 000", email: "anna@mail.com"),
                             Contact(name: "Lulu", phone: "+9 123 000", email: "ioan@mail.comm")]
                  ),
            Event(name: "Григорий Иванович",
                  detail: "Само исследование проходит",
                  address: "Москва, Театральная д. 12",
                  coordinates: (lat: 56.75672, lng: 36.6179971),
                  avatar: "ava3",
                  categoryImage: "categoryListKids",
                  status: "arhived",
                  marker: "markerKids",
                  markerSelected: "markerSelectedKids",
                  direction: "Москва, ул.Центральная, д.12",
                  contacts: [Contact(name: "Kristi", phone: "+9 000 000", email: "anna@mail.com"),
                             Contact(name: "Matyu", phone: "+9 123 000", email: "ioan@mail.comm")]
            )
        ]
    }
}

struct Category {
    var name: String
    var icon: String
    
    static func getCategories()->[Category] {
        return [
            Category(name: "Экология", icon: "categoryEco"),
            Category(name: "Социальные", icon: "categorySocial"),
            Category(name: "Медицина", icon: "categoryMedicine"),
            Category(name: "Дети", icon: "categoryKids"),
            Category(name: "Животные", icon: "categoryAnimal")
        ]
    }
}



