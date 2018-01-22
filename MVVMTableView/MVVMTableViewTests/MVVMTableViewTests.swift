//
//  MVVMTableViewTests.swift
//  MVVMTableViewTests
//
//  Created by Rajeshkumar maddi on 22/01/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import XCTest
@testable import MVVMTableView

class MVVMTableViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testMobileiPhone()
    {
        let iphone = MobileModel(name: "iPhone", model: "X", company: "Apple", Year: "2017")
        let mobileVM = ViewModel(mobile: iphone)
        XCTAssertEqual(mobileVM.mobileName, "iPhone")
        XCTAssertEqual(mobileVM.modelName, "X")
        XCTAssertEqual(mobileVM.company, "Apple")
        XCTAssertEqual(mobileVM.mnfgYear, "2017")
    }
 
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
