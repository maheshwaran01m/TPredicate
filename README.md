# TPredicate

Steps to add Package:

Open Xcode
 - ProjectFile
 - Package Dependencies
 - Add New Package
 -  Package [TPredicate_URL](https://github.com/maheshwaran01m/TPredicate)

Usage:
 - import TPredicate

let predicate = \A.name == "mahesh"

let andPredicate = \A.name == "Maheshwaran" && \B.isWorking == true

let orPredicate = \B.projectInSwiftUI >= 1 || \B.isWorking != false
