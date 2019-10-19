//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation


final class ContactsViewModel {
    
    var contacts: [[Contact]] = []
    private var data: [Contact] = []
    var trigger: Trigger?
    
    var sort: SortingType = .Ascending {
        didSet {
            sorting()
        }
    }
    
    init(data: [Contact] = []) {
        self.data = data
    }
    
    // MAR: - RestAPI
    // Load contacts from the server
    func loadContents() {
        RestApiService.makeRequest { [weak self] (result: Response<[Contact]>) in
            DispatchQueue.main.async {
            switch result {
            case .Success(let value):
                self?.data = value
                self?.contacts = self?.postProcessData(input: value)  ?? []
            case .Failed( _ ):
                self?.contacts = []
            }
            self?.trigger?()
            }
        }
    }
    
    // MARK: - Filter
    // Filter the content based on firstname
    func filterContent(search: String) {
        
        guard  search.isEmpty == false else {
            contacts = postProcessData(input: data)
            trigger?()
            return
        }
        
        // Contact filter logics
        let filtered = data.filter {
            $0.name.range(of: search, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil) != nil
        }
        
        // Generating data compatible for display format
        contacts = postProcessData(input: filtered)
        trigger?()
        
    }
    
    // MARK: - Grouping
    // Generating data compatible for display format
    private func postProcessData(input: [Contact]) -> [[Contact]] {
        input.sortAndGroup(sort: sort)
    }
    
    // MARK: - Sorting
    private func sorting() {
        contacts = postProcessData(input: data)
        trigger?()
    }
    
}



