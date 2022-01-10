//
//  Protocol+Test.swift
//  demo
//
//  Created by Jason on 2021/11/17.
//  Copyright © 2021 youzy. All rights reserved.
//

import UIKit

protocol Container {
    associatedtype Item

    mutating func append(_ item: Item)

    var count: Int { get }

    subscript(i: Int) -> Item { get }

    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item

    func makeIterator() -> Iterator
}

protocol ComparableContainer: Container where Item: Comparable { }



protocol Food {
    func desc() -> String
}

protocol Animal {
    func eat(food: Food)
}


protocol Animal2 {
    associatedtype Element

    func eat(food: Element)
}

class People2<F: Food>: Animal2 {
    typealias MF = F
    
    func eat(food: MF) {
        print("eat \(food.desc())")
    }
}

