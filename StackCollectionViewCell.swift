//
//  StackCollectionViewCell.swift
//  Sorting
//
//  Created by Sylvia Sesay on 4/30/19.
//  Copyright © 2019 Sylvia Sesay. All rights reserved.
//

import UIKit

class StackCollectionViewCell: UICollectionViewCell {
    Last-in first-out stack (LIFO)
    Push and pop are O(1) operations.
    */
    public struct Stack<T> {
        fileprivate var array = [T]()
        
        public var isEmpty: Bool {
            return array.isEmpty
        }
        
        public var count: Int {
            return array.count
        }
        
        public mutating func push(_ element: T) {
            array.append(element)
        }
        
        public mutating func pop() -> T? {
            return array.popLast()
        }
        
        public var top: T? {
            return array.last
        }
    }
    
    extension Stack: Sequence {
        public func makeIterator() -> AnyIterator<T> {
            var curr = self
            return AnyIterator {
                return curr.pop()
            }
        }
    }
    
}
