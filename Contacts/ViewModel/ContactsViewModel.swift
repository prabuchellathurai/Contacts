//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation


class ContactsViewModel {
    
    var contacts: [[Contact]] = []
    private var originalContacts: [Contact] = []
    var trigger: Trigger!
    
    var sort: SortingType = .Ascending {
        didSet {
            sorting()
        }
    }
    
    func loadContents() {
        RestApiService.makeRequest { [weak self] (result: Response<[Contact]>) in
            DispatchQueue.main.async {
            switch result {
            case .Success(let value):
                self?.originalContacts = value
                self?.contacts = self?.postProcessData(input: value)  ?? []
            case .Failed( _ ):
                self?.contacts = []
            }
            self?.trigger()
            }
        }
    }
    
    func filterContent(search: String) {
        
        guard  search.isEmpty == false else {
            contacts = postProcessData(input: originalContacts)
            trigger()
            return
        }
        
        let filtered = originalContacts.filter {
            $0.name.range(of: search, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil) != nil
        }
        contacts = postProcessData(input: filtered)
        trigger()
        
    }
    
    private func postProcessData(input: [Contact]) -> [[Contact]] {
        input.sortAndGroup(sort: sort)
    }
    
    private func sorting() {
        contacts = postProcessData(input: originalContacts)
        trigger()
    }
    
}



