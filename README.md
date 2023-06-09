# TPredicate

Use Case:

Open Xcode
 - ProjectFile
 - Package Dependencies
 - Add New Package
 -  Package [TPredicate_URL](https://github.com/maheshwaran01m/TPredicate)

Usage:
 - import TPredicate

let predicate = \A.name = "mahesh"
let andPredicate = \A.name == "Maheshwaran" && \B.jobExp >= 1
let orPredicate = \B.jobExp >= 1 || \B.isWorking == false
