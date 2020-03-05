//
//  ContactViewController.swift
//  NextMovie
//
//  Created by mjm on 13/02/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController {
    
    @IBAction func launchEmailClient(sender: Any){
        sendEmail()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



extension ContactViewController: MFMailComposeViewControllerDelegate{

    func sendEmail(){
        guard MFMailComposeViewController.canSendMail() else{
            return print("Erreur envoi e-mail")
        }
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["leo151098@hotmail.fr"])
        mail.setMessageBody("<p>Vous êtes formidable !</p>", isHTML: true)
        mail.setSubject("Demande d'information")
        
        present(mail, animated:true)
        print("email envoyé")
        
    }
    func mailComposeController(controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        controller.dismiss(animated: true)
    }
}
