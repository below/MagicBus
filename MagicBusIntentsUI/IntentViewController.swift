//
//  IntentViewController.swift
//  MagicBusIntentsUI
//
//  Created by Alexander v. Below on 25.03.19.
//  Copyright © 2019 Alexander von Below. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet var ticketKindLabel : UILabel!
    @IBOutlet var destinationLabel : UILabel!
    @IBOutlet var infoLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        
        guard let intent = interaction.intent as? BuyTicketIntent else {
            completion(false, parameters, CGSize.zero)
            return
        }

        if let destination = intent.destination {
            destinationLabel.text = destination
            ticketKindLabel.text = "Einfache Fahrt"
        } else {
            destinationLabel.text = ""
            ticketKindLabel.text = "Tageskarte"
        }
        
        infoLabel.text = "Preis: €1,99"
        
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return CGSize(width:320, height:170) // self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
