
// TPredicate.swift

// Copyright (c) 2023 Maheshwaran (https://github.com/maheshwaran01m)


import Foundation
import CoreData

// MARK: - Compound operators

public func && (a: NSPredicate, b: NSPredicate) -> NSPredicate {
  NSCompoundPredicate(andPredicateWithSubpredicates: [a, b])
}

public func || (a: NSPredicate, b: NSPredicate) -> NSPredicate {
  NSCompoundPredicate(orPredicateWithSubpredicates: [a, b])
}

public prefix func ! (a: NSPredicate) -> NSPredicate {
  NSCompoundPredicate(notPredicateWithSubpredicate: a)
}

// MARK: - Comparison operators

public func == <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .equalTo)
}

public func != <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .notEqualTo)
}

public func < <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThan)
}

public func <= <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThanOrEqualTo)
}

public func > <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThan)
}

public func >= <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThanOrEqualTo)
}

// MARK: - Optional Comparison

public func < <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThan)
}

public func <= <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThanOrEqualTo)
}

public func > <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThan)
}

public func >= <T>(lhs: KeyPath<some NSManagedObject, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThanOrEqualTo)
}

// MARK: - Examples

class A: NSManagedObject {
  var name: String? = "Maheshwaran"
}

class B: NSManagedObject {
  var job: String? = "iOS Developer"
  var jobExp: Int = 1
  var isWorking: Bool = true
}

public struct TPredicate {
  public init() {}
  
  public let predicate = \A.name == "Maheshwaran"
}

extension TPredicate {
  
  private func examples() {
    
    //    MARK: - Valid Predicate
    
    let notEqual = \A.name != "welcome"
    let notNil = \A.name != nil
    
    let andPredicate = \A.name == "Maheshwaran" && \B.jobExp >= 1
    let orPredicate = \B.jobExp >= 1 || \B.isWorking == false
    
    let lessThanPredicate = \B.jobExp < 1
    let greaterThanPredicate = \B.jobExp >= 2
    
    //  MARK: - Invalid Predicate Error
    
    //   Compile Error - Binary operator '==' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, String?>' and 'Int'
    //   let invalidPredicate = \B.job == 0
    
    //  Compile Error - Binary operator '<' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, Int>' and 'String'
    //  private let invalidLessThanPredicate = \B.jobExp < "Mahesh"
    
    // Compile Error - Cannot convert value of type 'String' to expected argument type 'Bool'
    //    let inValideOrPredicate = \B.jobExp >= 1 || \B.isWorking == "false"
  }
}
