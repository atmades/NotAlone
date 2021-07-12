//
//  ContactsViewModel.swift
//  NotAlone v2
//
//  Created by Максим on 19.05.2021.
//  Copyright © 2021 Maxim Nikitin. All rights reserved.
//

import Foundation

protocol ContactsEventViewModel: AnyObject {
    
    // MARK: - Properties
    var contactsBind: Dynamic<[Contact]> { get }
    
    // MARK: - Functions
    func didAddContactTap()
    func didRemoveContactTap(index: Int)
    func didUseMyConstactsTap()
    func didContactNameChanged(name: String, index: Int)
    func didContactPhoneChanged(phone: String, index: Int)
    func didContactEmailChanged(email: String, index: Int)
}

class ContactsEventViewModelImpl: ContactsEventViewModel {
    
    var myContact = Contact.getMyContact()
    var contactsBind = Dynamic([Contact()])
    
    func didAddContactTap() {
        contactsBind.value.append(Contact())
    }
    
    func didRemoveContactTap(index: Int) {
        contactsBind.value.remove(at: index)
    }
    
    func didUseMyConstactsTap() {
        contactsBind.value.remove(at: 0)
        contactsBind.value.insert(myContact, at: 0)
    }
    
    func didContactNameChanged(name: String, index: Int) {
        contactsBind.value[index].name = name
    }
    
    func didContactPhoneChanged(phone: String, index: Int) {
        contactsBind.value[index].phone = phone
    }
    
    func didContactEmailChanged(email: String, index: Int) {
        contactsBind.value[index].email = email
    }
}
