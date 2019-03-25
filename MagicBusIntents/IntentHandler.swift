//
//  IntentHandler.swift
//  MagicBusIntents
//
//  Created by Alexander v. Below on 25.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import Intents
import BusConductor

class IntentHandler: INExtension, BuyTicketIntentHandling {
    
    func confirm(intent: BuyTicketIntent, completion: @escaping (BuyTicketIntentResponse) -> Void) {
        
        guard let destination = intent.destination else {
            completion(.init(code: .failure, userActivity: nil))
            return
        }
        
        if destination == "Düsseldorf" {
            completion(.failureDestination(destination))
        } else {
            completion(.init(code: .success, userActivity: nil))
        }
    }
    
    func handle(intent: BuyTicketIntent, completion: @escaping (BuyTicketIntentResponse) -> Void) {
        
        let ticket = Ticket(intent: intent)
        
        let busConductor = Conductor()
        busConductor.purchaseTicket(ticket: ticket)
        completion(.successPrice("€ 1,99"))
    }
}
