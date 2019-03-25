//
//  Ticket.swift
//  BusConductor
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit

public class Ticket : Codable {
    public enum Kind : Codable {
        case single(destination: String)
        case day
        
        private enum CodingKeys: String, CodingKey {
            case destination
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            if let value = try? values.decode(String.self, forKey: .destination) {
                self = .single(destination: value)
                return
            }
            else {
                self = .day
                return
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case .day:
                break
            case .single(let destination):
                try container.encode(destination, forKey: .destination)
            }
        }
        
    }
    public var kind : Kind
    public var purchaseDate : Date
    
    public init(kind: Kind, purchaseDate : Date) {
        self.kind = kind
        self.purchaseDate = purchaseDate
    }
    
    public convenience init(kind: Kind) {
        self.init(kind: kind, purchaseDate: Date())
    }
    
    public convenience init(intent: BuyTicketIntent) {
        var kind : Kind!
        if let destination = intent.destination {
            kind = .single(destination: destination)
        } else {
            kind = .day
        }
        self.init(kind: kind)
    }
    
    var intent : BuyTicketIntent { get {
        let intent = BuyTicketIntent()
        if case .single (let destination) = self.kind {
            intent.destination = destination
        }
        return intent
        }
    }
}
