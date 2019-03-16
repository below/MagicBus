//
//  Ticket.swift
//  BusConductor
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit

public class Ticket {
    public enum Kind {
        case single(destination: String)
        case day
    }
    public var kind : Kind
    public var purchaseDate : Date = Date()

    public init(kind: Kind) {
        self.kind = kind
    }
}
