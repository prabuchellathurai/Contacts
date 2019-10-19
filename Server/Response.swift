//
//  Response.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation

// Generic Success and Failures response of RestApi calls
// We can create any success response codable model
// we can create failure model
//
enum Response<T: Decodable> {
    case Success(T)
    case Failed(Error)
}


// Custom Error
// Used to find type of errors. Based on we are handling errors.
enum ContactError: Error {
    case Invalid
}
