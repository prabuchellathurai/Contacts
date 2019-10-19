# Contacts

This iOS contact application is fetch the contact details from the server and display in a tableview.

# NOTE
If you are using xcode 11 to run this application. iPhonesimulator some times stuck. In this case restart your simulator. This is Xcode11 issue.

# Features
* Sorting the contacts in ascending and decending order
* User can able to search based on firstname
* Contacts are grouped by Alphabetical order

# Techniques
This are the techniques in this application,
* SOLID principles
* MVVM Design Pattern
* Unit Test Cases 

# SOLID Principles
Used single responsibility for all the classes. There is only one reason to change the particular class. If we are working in one feature it don't affect other features.

# MVVM (MODEL -> VIEW -> View Model)
The advantages of using MVVM,
* Code is losely coupled
* Writing unit test case is easy

# Classes
RestApiService.swift  :
This is the generic class to make rest api calls. And convert the json object in to model object

ArrayExtension.swift   :
This is an extension of Array. It contains sorting and grouping algorithm

ErrorTypes.swift    : [enum]
This class is used for error handling. We can customize errors.




