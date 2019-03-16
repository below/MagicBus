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
    internal let historyStoreKey = "HistoryStore"
    
    public init() {
        let decoder = JSONDecoder()
        do {
            if let data = UserDefaults.standard.data(forKey: historyStoreKey){
                let newHistory = try decoder.decode([Ticket].self, from: data)
                historyStore = newHistory
            }
        }
        catch {}
    }

    public var history : [Ticket]? {
        get {
            return historyStore
        }
    }
    
    public func purchaseTicket (ticket : Ticket) {
        historyStore.append(ticket)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(historyStore)
            UserDefaults.standard.set(data, forKey: historyStoreKey)
        }
        catch {
            print ("Did not work!")
        }
    }
}
