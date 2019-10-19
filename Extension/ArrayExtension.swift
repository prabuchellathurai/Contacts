//
//  ArrayExtension.swift
//  Contacts
//
//  Created by Prabhu on 19/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation

extension Array where Element == Contact {
    
    func sortAndGroup(sort: SortingType) -> [[Element]] {
        
        var sortedContacts: [Element] = []
        
        switch sort {
        case .Ascending:
            sortedContacts = self.sorted { $0.name < $1.name}
        default:
            sortedContacts = self.sorted { $0.name > $1.name}
        }
        
        var character: String = ""
        var temp: [Element] = []
        var group: [[Element]] = []
        
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
    
}
