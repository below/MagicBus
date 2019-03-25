//
//  HistoryTableViewController.swift
//  MagicBus
//
//  Created by Alexander v. Below on 16.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import UIKit
import BusConductor

class HistoryTableViewController: UITableViewController, TicketController {
    
    private var history : [Ticket]?
    private let df : DateFormatter = { () -> DateFormatter in  let df = DateFormatter(); df.dateStyle = .short; df.timeStyle = .short; return df}()
    var conductor: Conductor! {
        didSet {
            history = conductor.history
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let userActivity = NSUserActivity(activityType: "com.vonbelow.magicbus.history")
        userActivity.isEligibleForSearch = true
        userActivity.title = "Bisherige Käufe"
        userActivity.isEligibleForPrediction = true
        
        self.userActivity = userActivity
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return history?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)

        if let ticket = history?[indexPath.row] {
            switch ticket.kind {
                case .single(let destination):
                    cell.textLabel?.text = destination
                case .day:
                    cell.textLabel?.text = NSLocalizedString("Tagesticket", comment: "")
            }
            cell.detailTextLabel?.text = self.df.string(from: ticket.purchaseDate)
        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
