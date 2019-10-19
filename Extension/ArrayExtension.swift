//
//  ArrayExtension.swift
//  Contacts
//
//  Created by Prabhu on 19/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation

extension Array where Element == Contact {
    
    // Group the contact details
    func sortAndGroup(sort: SortingType) -> [[Element]] {
        
        let sortedContacts: [Element] = contactSorting(sort: sort)
        
        var character: String = ""
        var temp: [Element] = []
        var group: [[Element]] = []
        
        // Grouping Algorithm 
        for contact in sortedContacts {
            let firstLetter = contact.name.prefix(1)
            if firstLetter == character {
                temp.append(contact)
            } else {
                character = String(firstLetter)
                if temp.count > 0 {
                    group.append(temp)
                }
                temp = [contact]
            }
        }
        if temp.count > 0 {
            group.append(temp)
        }
        
        return group
    }
    
    // Sort the contact details
    private func contactSorting(sort: SortingType) -> [Element] {
        var sortedContacts: [Element] = []
        switch sort {
        case .Ascending:
            // Ascending order sorting
            sortedContacts = self.sorted { $0.name < $1.name}
        default:
            // Decending order sorting
            sortedContacts = self.sorted { $0.name > $1.name}
        }
        return sortedContacts
    }
    
}
