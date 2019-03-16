//
//  Conductor.swift
//  BusConductor
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import Foundation

public class Conductor {
    internal var historyStore = [Ticket]()
    
    public init() {}

    public var history : [Ticket]? {
        get {
            return historyStore
        }
    }
    
    public func purchaseTicket (ticket : Ticket) {
        historyStore.append(ticket)
    }
}
