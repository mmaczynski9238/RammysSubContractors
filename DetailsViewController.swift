//
//  DetailsViewController.swift
//  RammysSubContractors
//
//  Created by student1 on 5/5/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MessageUI


class DetailsViewController: UIViewController, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var callBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }
    @IBAction func phoneCall(sender: UIButton) {
        callNumber("(847)-215-7330")
    }
    @IBAction func sendText(sender: UIButton) {
                if (MFMessageComposeViewController.canSendText()) {
                let controller = MFMessageComposeViewController();
                controller.body = "";
                controller.recipients = ["(847)-215-7330"]
                controller.messageComposeDelegate = self;
                self.presentViewController(controller, animated: true, completion: nil);
            }
        }
        
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result:MessageComposeResult) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        override func viewWillDisappear(animated: Bool) {
            self.navigationController?.navigationBarHidden = false
        }
    }
