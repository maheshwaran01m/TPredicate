import Foundation
import CoreData

public struct TPredicate {
  
  public private(set) var text = "Predicate"
  
  public init() {}
}

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
