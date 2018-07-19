//
//  LoginViewController.swift
//  ServiceManagerDevRe
//
//  Created by Yoochan Shin on 2018/7/15.
//  Copyright © 2018 CISSDev. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import GameplayKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eMail.attributedPlaceholder = NSAttributedString(string: "E-Mail", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) { // Show keyboard automatically
        super.viewWillAppear(animated)
        eMail.becomeFirstResponder()
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        if eMail.text == "" {
            createAlert(title: "Please insert your \ne-mail address.", message: "", button: "Okay")
        } else {
            sendEmail()
            createAlert(title: "Password Generated", message: "A generated password was sent to your inbox.", button: "Got it!")
        }
    }
    
    func randomPasswordGenerator() -> String { // Generate password of 8 characters
        let sourceString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        var sequenceOfCharacters: [Character] = []
        for item in sourceString {
            sequenceOfCharacters.append(item)
        }
        var index = 1
        let passwordLength = 8
        var generatedPassword: [Character] = []
        var randomPositionPicker: Int
        while index <= passwordLength {
            randomPositionPicker = GKRandomSource.sharedRandom().nextInt(upperBound: sequenceOfCharacters.count)
            generatedPassword.append(sequenceOfCharacters[randomPositionPicker])
            index += 1
        }
        let randomPassword = String(generatedPassword)
        return randomPassword
    }
    
    func sendEmail() { // Send password to user inbox
        let mailComposeViewController = passwordMail()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            createAlert(title: "E-mail Error", message: "Sorry, the generated password could not be sent to your mail inbox.", button: "Okay")
        }
    }
    
    func passwordMail() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
        mailComposerVC.setToRecipients([(eMail.text)!])
        mailComposerVC.setSubject("Generated Password")
        mailComposerVC.setMessageBody("Your generated password is: " + randomPasswordGenerator(), isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    func createAlert (title: String, message: String, button: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
