//
//  ContactsTests.swift
//  ContactsTests
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import XCTest
@testable import Contacts

class ContactsTests: XCTestCase {
    
    var contacts: [Contact] = []
    var viewModel: ContactsViewModel!

    // Generating stub data
    override func setUp() {
        contacts = [Contact(name:"Steve Jobs"),
                    Contact(name:"Sachin"),
                    Contact(name:"Ramesh"),
                    Contact(name:"Bill Gates"),
                    Contact(name:"Ella"),
                    Contact(name:"Jose"),
                    Contact(name:"Eddie"),
                    Contact(name:"Benjamin"),
                    Contact(name:"Tamir")]
        viewModel = ContactsViewModel(data: contacts)
    }

    override func tearDown() {
        
    }

    // Filter
    // Testing the filter logic is woking as expected
    func testFilter() {
        viewModel.contacts = contacts.sortAndGroup(sort: .Ascending)
        viewModel.filterContent(search: "Steve Jobs")
        guard let item = viewModel.contacts.first?.first else {
            assert(false, "Decending order sorting failed")
            return
        }
        assert(item.name == "Steve Jobs", "Decending order sorting failed")
    }

    // Checking the performance of sorting and grouping algorithm
    // We can set baseline and alter the logic
    func testPerformanceSortAndGroup() {
        self.measure {
            let group = contacts.sortAndGroup(sort: .Ascending)
            assert(group.count > 0, "Grouping Failed")
        }
    }
    
    // Sorting
    // To check the ascending order sorting
    // Check with stub data
    func testSortingAscending() {
        viewModel.sort = .Ascending
        guard let item = viewModel.contacts.first?.first else {
            assert(false, "Ascending order sorting failed")
            return
        }
        assert(item.name == "Benjamin", "Ascending order sorting failed")
    }
    
    // Sorting
    // To check the decending order sorting
    // Check with stub data
    func testSortingDecending() {
        viewModel.sort = .Decending
        guard let item = viewModel.contacts.first?.first else {
            assert(false, "Decending order sorting failed")
            return
        }
        assert(item.name == "Tamir", "Decending order sorting failed")
    }

    // Checking the asynchronous operation is working as expected
    // Expectation timout interval is 2 sec
    func testRestAPI() {
        let exceptation: XCTestExpectation = expectation(description: "")
        RestApiService.makeRequest { (data: Response<Contact>) in
            XCTAssertNotNil(data, "No data was downloaded.")
            exceptation.fulfill()
        }
        wait(for: [exceptation], timeout: 2)
    }
    
}


