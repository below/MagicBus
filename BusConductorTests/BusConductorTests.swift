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
        let expectedCount = (conductor.history?.count ?? 0) + 1
        conductor.purchaseTicket (ticket: ticket)
        XCTAssertEqual(conductor.history?.count, expectedCount)
    }

    func testEncode() {
        let encoder = JSONEncoder()
        var data : Data!
        XCTAssertNoThrow(data = try encoder.encode(ticket))
        XCTAssertNotNil(data)
        let decoder = JSONDecoder()
        var decodedTicket : Ticket!
        XCTAssertNoThrow(decodedTicket = try decoder.decode(Ticket.self, from: data))
        XCTAssertNotNil(decodedTicket)
    }

    func testStorage () {
        let originalDestination = "Köln"
        let expectedCount = (conductor.history?.count ?? 0) + 1
        conductor.purchaseTicket (ticket: Ticket.init(kind: .single(destination: originalDestination)))
        XCTAssertEqual(conductor.history?.count, expectedCount)
        let newConductor = Conductor()
        XCTAssertEqual(newConductor.history?.count, expectedCount)
        if let newTicket = newConductor.history?.last {
            if case .single(let destination) = newTicket.kind {
                XCTAssertEqual(destination, originalDestination)
                return
            }
        }
        XCTFail()
    }
}
