//
//  Queue.swift
//  Sorting
//
//  Created by Sylvia Sesay on 4/30/19.
//  Copyright © 2019 Sylvia Sesay. All rights reserved.
//

import UIKit

class Queue: UICollectionViewCell {
    private class Node<Element: Comparable> {
        
        let value: Element
        weak var previous: Node?
        var next: Node?
        
        init(_ value: Element) {
            self.value = value
        }
    }
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var size: Int {
        var count = 0
        var current = head
        while (current != nil) {
            current = current?.next
            count += 1
        }
        return count
    }
    public func enqueue(_ element: Element) {
        guard contains(element) == false else {
            return
        }
        
        let newNode = Node(element)
        tail?.next = newNode
        newNode.previous = tail
        
        tail = newNode
        
        if head == nil {
            head = tail
        }
    }
    public func dequeue() -> Element? {
        let element = head
        
        head = element?.next
        
        if head == nil {
            tail = nil
        }
        
        return element?.value
    }
    public var elements: [Element] {
        get {
            var result: [Element] = []
            
            var current = head
            while let node = current {
                result.append(node.value)
                current = node.next
            }
            
            return result
        }
    }
    
}
