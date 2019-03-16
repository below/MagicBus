//
//  MainTableViewController.swift
//  MagicBus
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit
import BusConductor

protocol TicketController  {
    var conductor : Conductor! { get set }
}

class MainTableViewController: UITableViewController {

    var conductor = Conductor()
    
    // MARK: - Table view data source

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
