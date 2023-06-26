
// TPredicate.swift

// Copyright (c) 2023 MAHESHWARAN (https://github.com/maheshwaran01m)


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

public func == <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .equalTo)
}

public func != <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .notEqualTo)
}

public func < <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThan)
}

public func <= <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThanOrEqualTo)
}

public func > <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThan)
}

public func >= <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThanOrEqualTo)
}

// MARK: - Optional Comparison

public func < <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThan)
}

public func <= <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThanOrEqualTo)
}

public func > <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThan)
}

public func >= <T: Equatable, K>(lhs: KeyPath<K, T>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThanOrEqualTo)
}

// MARK: - Swift Data

#if swift(>=5.9)
import SwiftData

// MARK: - Compound operators

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public prefix func ! <T>(value: KeyPath<T, Bool>) -> Predicate<T> {
  value == false
}

// MARK: - Comparison operators

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func ==<T: Equatable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Equal(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func !=<T: Equatable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_NotEqual(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func < <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .lessThan)
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func <= <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .lessThanOrEqual)
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func > <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .greaterThan)
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func >= <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .greaterThanOrEqual)
  })
}

// MARK: Optional

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func ==<T: Equatable, E>(lhs: KeyPath<E, T?>, rhs: T?) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_Equal(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  })
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func !=<T: Equatable, E>(lhs: KeyPath<E, T?>, rhs: T?) -> Predicate<E> where T: Codable {
  Predicate<E>({
    PredicateExpressions.build_NotEqual(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  })
}
#endif

// MARK: - Examples

class A {
  var name: String? = "Maheshwaran"
}

class B {
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
    /*
     let notEqual = \A.name != "welcome"
     let notNil = \A.name != nil
     
     let andPredicate = \A.name == "Maheshwaran" && \B.jobExp >= 1
     let orPredicate = \B.jobExp >= 1 || \B.isWorking == false
     
     let lessThanPredicate = \B.jobExp < 1
     let greaterThanPredicate = \B.jobExp >= 2
     
     //  MARK: Invalid Predicate Error
     //   Compile Error - Binary operator '==' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, String?>' and 'Int'
     let invalidPredicate = \B.job == 0
     
     //  Compile Error - Binary operator '<' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, Int>' and 'String'
     private let invalidLessThanPredicate = \B.jobExp < "Mahesh"
     
     // Compile Error - Cannot convert value of type 'String' to expected argument type 'Bool'
     let inValideOrPredicate = \B.jobExp >= 1 || \B.isWorking == "false"
     */
  }
}
