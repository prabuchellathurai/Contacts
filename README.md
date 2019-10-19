# Contacts

This iOS contact application is fetch the contact details from the server and display in a tableview.

Features:
* Sorting the contacts in ascending and decending order
* User can able to search based on firstname
* Contacts are grouped by Alphabetical order

Techniques
I used below techniques in this application,
* SOLID principles
* MVVM Design Pattern
* Unit Test Cases 

SOLID Principles
I assigned single responsibility for all the classes. Example: {RestApiService, Response}
There is only one reason to change the particular class. It don't affect other functionalities.

MVVM (MODEL -> VIEW -> View Model)
What is MVVM?
* VIEW hold the reference of VIEWMODEL
* VIEWMODEL hold the reference of MODEL
The advantages,
* Code is losely coupled
* Writing unit test case is easy

Classes:
RestApiService.swift: {Single Responsiblity Principle}
To make rest api calls.

ArrayExtension.swift
It contains sorting and grouping algorithn

ContactsTableViewController.swift
View class

ContactsViewModel.swift
Viewmodel class. It works intermediate between view and model

Model: {Contact, Address, Company}
It persisting contact details


NOTE : 
If you are using xcode 11 to run this application. iPhonesimulator some times stuck. In this case restart your simulator. This is Xcode11 issue.



