//
//  SignupViewController.swift
//  ServiceManagerDev
//
//  Created by Yoochan Shin on 2018/7/3.
//  Copyright © 2018 Yoochan Shin. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstNameAsterisk.isHidden = true
        lastNameAsterisk.isHidden = true
        emailAsterisk.isHidden = true
        passwordAsterisk.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var firstName: UITextField! // ALL THE SIGN UP FIELDS
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var firstNameAsterisk: UILabel! // ALL THE ASTERISKS
    @IBOutlet weak var lastNameAsterisk: UILabel!
    @IBOutlet weak var emailAsterisk: UILabel!
    @IBOutlet weak var passwordAsterisk: UILabel!
    
    @IBAction func createMyAccount(_ sender: Any) { // If text field is empty, show asterisks
        let textFieldsArray = [firstName.text!, lastName.text!, email.text!, password.text!]
        let asterisks = [firstNameAsterisk, lastNameAsterisk, emailAsterisk, passwordAsterisk]
        for (textFieldElement, asterisk) in zip(textFieldsArray, asterisks) {
            if textFieldElement == ""{
                asterisk?.isHidden = false
            } else {
                asterisk?.isHidden = true
            }
        }
        if textFieldsArray != ["", "", "", ""] {
            if password.text!.count < 8 {
                createAlert(title: "The password must contain at least 8 characters.", message: "", button: "Okay")}
            else {self.firstName.resignFirstResponder()
                self.lastName.resignFirstResponder()
                self.email.resignFirstResponder()
                self.password.resignFirstResponder()
            }
        } // GOTTA FIX THE BUG WHERE IT STILL SHOWS ALERT EVEN WHEN OTHER FIELDS ARE EMPTY
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
