//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Prabhu on 18/10/19.
//  Copyright © 2019 sample. All rights reserved.
//

import UIKit

final class ContactsTableViewController: UITableViewController {

    private var searchController = UISearchController()
    private var viewModel = ContactsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adding searchbar in navigation items
        // Pull up to hide the searchbar
        // Pull down to see the searchbar
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        initialSetup()
    }
    
    private func initialSetup() {
        viewModel.trigger = {
                self.tableView.reloadData()
        }
        addNavigationBarActionItems()
        viewModel.loadContents()
    }
    
    private func addNavigationBarActionItems() {
        
        let leftBarItem = UIBarButtonItem(title: "A-Z", style: .plain, target: self, action: #selector(ascendingOrder(button:)))
        navigationItem.leftBarButtonItem = leftBarItem
        
         let rightBarItem = UIBarButtonItem(title: "Z-A", style: .plain, target: self, action: #selector(decendingOrder(button:)))
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc
    @IBAction func ascendingOrder(button: UIBarButtonItem) {
        viewModel.sort = .Ascending
    }
    
    @objc
    @IBAction func decendingOrder(button: UIBarButtonItem) {
        viewModel.sort = .Decending
    }
    
    // Check searchbar is enabled currently
    var isFilterEnabled: Bool {
        return searchController.isActive && isFilterEmpty
    }
    
    // Readonly variable for check that searchbar is empty
    var isFilterEmpty: Bool {
        return searchController.searchBar.text?.isEmpty == false
    }

}

// MARK: - Searchbar Delegate
// Searchbar updating delegate method Implementation
extension ContactsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text
        viewModel.filterContent(search: text!)
    }
    
}


// MARK: - Table view data source
extension ContactsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.contacts.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let item = viewModel.contacts[section].first else {
            return "[Unknown]"
        }
        return item.name.count > 0 ? "\(item.name.first!)" : ""
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contacts[section].count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "default")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "default")
        }
        let contactList = viewModel.contacts[indexPath.section]
        cell!.textLabel?.text = contactList[indexPath.row].name
        return cell!
    }
    
}
