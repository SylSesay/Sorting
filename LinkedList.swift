//
//  LinkedList.swift
//  Sorting
//
//  Created by Sylvia Sesay on 4/30/19.
//  Copyright © 2019 Sylvia Sesay. All rights reserved.
//

import UIKit

class LinkedList: UICollectionViewCell {
  class SingleLinkedList<T> {
        
        var head: SNode<T>? // head is nil when list is empty
        
        public var isEmpty: Bool {
            return head == nil
        }
        
        public var first: SNode<T>? {
            return head
        }
        
        public func append(value: T) {
            let newNode = SNode(value: value)
            if var h = head {
                while h.next != nil {
                    h = h.next!
                }
                h.next = newNode
                
            } else {
                head = newNode
            }
        }
        
        func insert(data : T, at position : Int) {
            let newNode = SNode(value: data)
            
            if (position == 0) {
                newNode.next = head
                head = newNode
            }
            else {
                var previous = head
                var current = head
                for _ in 0..<position {
                    previous = current
                    current = current?.next
                }
                
                newNode.next = previous?.next
                previous?.next = newNode
            }
        }
        
        func deleteNode(at position: Int)
        {
            if head == nil{
                return
            }
            var temp = head
            
            if (position == 0)
            {
                head = temp?.next
                return
            }
            
            for _ in 0..<position-1 where temp != nil {
                temp = temp?.next
            }
            
            if temp == nil || temp?.next == nil{
                return
            }
            
            let nextToNextNode = temp?.next?.next
            
            temp?.next = nextToNextNode
        }
        
        func printList() {
            var current: SNode? = head
            //assign the next instance
            while (current != nil) {
                print("LL item is: \(current?.value as? Int ?? 0)")
                current = current?.next
            }
        }
        
        
        func printReverseRecursive(node: SNode<T>?) {
            if node == nil{
                return
            }
            printReverseRecursive(node: node?.next)
            print("LL item is: \(node?.value as? Int ?? 0)")
        }
        
        func printReverse() {
            printReverseRecursive(node: first)
            
        }
    }
    

    

    

    
}
