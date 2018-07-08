//
//  UserViewController.swift
//  ServiceManagerDev
//
//  Created by Yoochan Shin on 2018/7/4.
//  Copyright © 2018 CISS. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var Avatar: UIImageView!
    
    @IBOutlet weak var Bio: UITextField!
    
    @IBOutlet weak var Notify: UISwitch!
    
    //  @IBOutlet weak var Signout: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // Touch the background to retract keyboard
        self.view.endEditing(true)
    }
    
    @IBAction func Bioo(_ sender: Any) {
        Bio.allowsEditingTextAttributes = true
        var biotext = ""
        biotext = Bio.text!
        Bio.becomeFirstResponder()
        




    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
