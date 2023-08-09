
// TPredicate.swift

// Copyright © 2023 MAHESHWARAN (https://github.com/maheshwaran01m)

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

// MARK: - Optional Compound operators

public prefix func ! (a: NSPredicate?) -> NSPredicate? {
  guard let a else { return nil }
  return NSCompoundPredicate(notPredicateWithSubpredicate: a)
}

public func && (a: NSPredicate?, b: NSPredicate?) -> NSPredicate? {
  guard let a, let b else { return nil }
  return NSCompoundPredicate(andPredicateWithSubpredicates: [a, b])
}

public func && (a: NSPredicate?, b: NSPredicate) -> NSPredicate? {
  guard let a else { return b }
  return NSCompoundPredicate(andPredicateWithSubpredicates: [a, b])
}

public func && (a: NSPredicate, b: NSPredicate?) -> NSPredicate? {
  guard let b else { return a }
  return NSCompoundPredicate(andPredicateWithSubpredicates: [a, b])
}

public func || (a: NSPredicate?, b: NSPredicate?) -> NSPredicate? {
  guard let a, let b else { return nil }
  return NSCompoundPredicate(orPredicateWithSubpredicates: [a, b])
}

public func || (a: NSPredicate?, b: NSPredicate) -> NSPredicate? {
  guard let a else { return b }
  return NSCompoundPredicate(orPredicateWithSubpredicates: [a, b])
}

public func || (a: NSPredicate, b: NSPredicate?) -> NSPredicate? {
  guard let b else { return a }
  return NSCompoundPredicate(orPredicateWithSubpredicates: [a, b])
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

public func == <T: Equatable, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .equalTo)
}

public func != <T: Equatable, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .notEqualTo)
}

public func < <T, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThan)
}

public func <= <T, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .lessThanOrEqualTo)
}

public func > <T, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
  NSComparisonPredicate(leftExpression: NSExpression(forKeyPath: lhs),
                        rightExpression: NSExpression(forConstantValue: rhs),
                        modifier: .direct, type: .greaterThan)
}

public func >= <T, K>(lhs: KeyPath<K, T?>, rhs: T?) -> NSPredicate {
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
  Predicate<E> {
    PredicateExpressions.build_Equal(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func !=<T: Equatable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_NotEqual(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func < <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .lessThan)
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func <= <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .lessThanOrEqual)
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func > <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .greaterThan)
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func >= <T: Comparable, E>(lhs: KeyPath<E, T>, rhs: T) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_Comparison(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs),
      op: .greaterThanOrEqual)
  }
}

// MARK: Optional

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func ==<T: Equatable, E>(lhs: KeyPath<E, T?>, rhs: T?) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_Equal(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  }
}

@available(macOS 14, iOS 17, tvOS 17, watchOS 10, *)
public func !=<T: Equatable, E>(lhs: KeyPath<E, T?>, rhs: T?) -> Predicate<E> where T: Codable {
  Predicate<E> {
    PredicateExpressions.build_NotEqual(
      lhs: PredicateExpressions.build_KeyPath(root: PredicateExpressions.build_Arg($0), keyPath: lhs),
      rhs: PredicateExpressions.build_Arg(rhs))
  }
}
#endif

// MARK: - Examples

/*
 let notEqual = \A.name != "welcome"
 let notNil = \A.name != nil
 
 let andPredicate = \A.name == "Maheshwaran" && \B.isWorking == true
 let orPredicate = \B.projectExp > 1 || \B.isWorking == true
 
 let lessThanPredicate = \B.swiftUIExp < 1
 let greaterThanPredicate = \B.jobExp > 1
 
 //  MARK: Invalid Predicate Error
 
 //   Compile Error - Binary operator '==' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, String?>' and 'Int'
 let invalidPredicate = \B.job == 0
 
 //  Compile Error - Binary operator '<' cannot be applied to operands of type 'ReferenceWritableKeyPath<B, Int>' and 'String'
 private let invalidLessThanPredicate = \B.jobExp < "Mahesh"
 
 // Compile Error - Cannot convert value of type 'String' to expected argument type 'Bool'
 let inValideOrPredicate = \B.jobExp >= 1 || \B.isWorking == "false"
 
 */
