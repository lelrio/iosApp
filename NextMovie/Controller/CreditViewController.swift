//
//  CreditViewController.swift
//  NextMovie
//
//  Created by mjm on 13/02/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {
    @IBAction func shareDidPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func share() {
        let activityItems:[Any] = [
            //UIImage[named:"image.png"],
            URL(string: "https;//ecole-webstart.com") as Any,
            "j'ai testé cette application, je vous la conseille !"
        ]
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated:true)
    }

}
