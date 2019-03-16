//
//  BusConductorTests.swift
//  BusConductorTests
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import XCTest
@testable import BusConductor

class BusConductorTests: XCTestCase {

    let ticket = Ticket(kind: .day, purchaseDate: Date(timeIntervalSinceReferenceDate: 574460942))
    
    var conductor = Conductor()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHistory() {
        conductor.purchaseTicket (ticket: ticket)
        XCTAssertEqual(conductor.history?.count, 1)
    }


}
