//
//  LoginViewController.swift
//  ServiceManagerDev
//
//  Created by Yoochan Shin on 2018/7/3.
//  Copyright © 2018 Yoochan Shin. All rights reserved.
//

import UIKit
import Foundation
import MessageUI
import GameplayKit

class LoginViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailAsterisk: UILabel!
    @IBOutlet weak var passwordAsterisk: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        emailAsterisk.isHidden = true
        passwordAsterisk.isHidden = true
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if email.text == "" {
            emailAsterisk.isHidden = false}
        if password.text == "" {
            passwordAsterisk.isHidden = false}
        if !(email.text == "" && password.text == "") {
            emailAsterisk.isHidden = true
            passwordAsterisk.isHidden = true
            self.email.resignFirstResponder()
            self.password.resignFirstResponder()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // Touch the background to retract keyboard
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotPassword(_ sender: Any)
    {
        if email.text == "" {
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
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([(email.text)!])
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
