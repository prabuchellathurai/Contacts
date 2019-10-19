//
//  Contact.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation

class Contact: Codable {
    var id: Int!
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var phone: String = ""
    var website: String = ""
    var address: Address!
    var company: Company!
}


