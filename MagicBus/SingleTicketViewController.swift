//
//  SingleTicketViewController.swift
//  MagicBus
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit
import BusConductor

class SingleTicketViewController: UIViewController, UITextFieldDelegate, TicketController {
    
    var conductor: Conductor!
    
    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        buyButton.isEnabled = !text.isEmpty
        return true
    }
    @IBAction func buySingleTicket() {
        if let destination = destinationField.text {
        let ticket = Ticket(kind: .single(destination: destination))
            self.conductor.purchaseTicket(ticket: ticket)
            self.showPurchaseSuccessfulAlert()
        }
    }
    
}
