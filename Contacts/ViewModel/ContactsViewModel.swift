//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation


class ContactsViewModel {
    
    var contacts: [Contact] = []
    var processedContacts: [Contact] = []
    var trigger: Trigger!
    
    init() {
       
    }
    
    func loadContents() {
        RestApiService.makeRequest { [weak self] (result: Response<[Contact]>) in
            switch result {
            case .Success(let value):
                self?.contacts = value
            case .Failed( _ ):
                self?.contacts = []
            }
            self?.trigger()
        }
    }
    
    func filterContent(search: String) {
        processedContacts = contacts.filter {
            $0.name.range(of: search, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil) != nil
        }
        trigger()
    }
    
    func sorting() {
        let value = contacts
        contacts = value
    }
    
}
