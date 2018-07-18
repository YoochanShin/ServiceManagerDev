//
//  SignUpViewController.swift
//  ServiceManagerDevRe
//
//  Created by Yoochan Shin on 2018/7/15.
//  Copyright © 2018 CISSDev. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        lastName.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        eMail.attributedPlaceholder = NSAttributedString(string: "E-Mail", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    override func viewWillAppear(_ animated: Bool) { // Show keyboard automatically
        super.viewWillAppear(animated)
        firstName.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
