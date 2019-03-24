//
//  Conductor.swift
//  BusConductor
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import Foundation

public class Conductor {
    
    public static let historyChangedNotification = Notification.Name("HistoryChangedNotification")

    internal var historyStore = [Ticket]()
    internal let historyStoreKey = "HistoryStore"
    
    var defaults : UserDefaults

    public init() {
        
        defaults = UserDefaults(suiteName: "group.com.vonbelow.MagicBus")!
        self.reloadHistory()
        NotificationCenter.default.addObserver(self, selector: #selector(userDefaultsDidChange(note:)), name: UserDefaults.didChangeNotification, object: nil)
    }

    @objc public func userDefaultsDidChange(note : Notification) {
        self.reloadHistory()
    }

    func reloadHistory () {
        let decoder = JSONDecoder()
        do {
            if let data = defaults.data(forKey: historyStoreKey){
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
        ticket.purchaseDate = Date()
        historyStore.append(ticket)
        NotificationCenter.default.post(name: Conductor.historyChangedNotification, object: nil)
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(historyStore)
            defaults.set(data, forKey: historyStoreKey)

        }
        catch {
            print ("Did not work!")
        }
    }
}
