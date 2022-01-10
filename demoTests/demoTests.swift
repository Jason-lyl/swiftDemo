//
//  demoTests.swift
//  demoTests
//
//  Created by Jason on 2020/6/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import XCTest
@testable import demo

class demoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let createdAt = "2021-08-19T08:11:39.763Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        var currentDate = dateFormatter.date(from: createdAt)
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        var dates: String = ""
        if let currentTime: Date = currentDate {
            dates = outputFormatter.string(from: currentTime)
        }
        print("111\(dates)")
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        currentDate = dateFormatter.date(from: createdAt)
        
        if currentDate == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS+08:00"
            currentDate = dateFormatter.date(from: createdAt)
        }

        if currentDate == nil {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            currentDate = dateFormatter.date(from: createdAt)
        }
        
        outputFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        if let currentTime: Date = currentDate {
            dates = outputFormatter.string(from: currentTime)
        }
        print("222\(dates)")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
