//
//  ProductsTableViewController.swift
//  MagicBus
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit
import BusConductor

extension UIViewController  {
    func showPurchaseSuccessfulAlert() {
        let alert = UIAlertController(title: NSLocalizedString("Erfolgreich", comment: ""), message: NSLocalizedString("Der Kauf war erfolgreich", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

class ProductsTableViewController: UITableViewController, TicketController {
    
    var conductor: Conductor!
    
    @IBAction func buyDayTicket(_ sender: UIButton) {
        conductor.purchaseTicket(ticket: Ticket(kind: .day))
        self.showPurchaseSuccessfulAlert()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var ticketController = segue.destination as? TicketController {
            ticketController.conductor = conductor
        }
    }
}
