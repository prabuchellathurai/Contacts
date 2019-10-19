//
//  RestApiService.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import Foundation

// This class is build 
class RestApiService {
    
    // Generic method to make service calls
    static func makeRequest<T: Decodable>(block: @escaping  (Response<T>) -> Void){
        let url: URL = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        // Creating data task
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                // Sending error response
                let errorResponse = Response<T>.Failed(error!)
                block(errorResponse)
            } else {
                do {
                    // Sending Success Response
                    // Decode any kind of codable object we are passing and send
                    // using blocks
                    let encoding = JSONDecoder()
                    let successResponse = try encoding.decode(T.self, from: data!)
                    let succResponse = Response<T>.Success(successResponse)
                    block(succResponse)
                }   catch {
                    let errorResponse = Response<T>.Failed(ContactError.Invalid)
                    block(errorResponse)
                }
            }
        }
        
        // Invoke HTTP url request
        task.resume()
    }
    
}
