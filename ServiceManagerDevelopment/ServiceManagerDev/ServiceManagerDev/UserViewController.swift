//
//  UserViewController.swift
//  ServiceManagerDev
//
//  Created by Yoochan Shin on 2018/7/4.
//  Copyright © 2018 CISS. All rights reserved.
//

import UIKit
import UserNotifications


class UserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profpic: UIImageView!

    
    @IBOutlet weak var Switch: UISwitch!

    
    var imagePicker = UIImagePickerController()
    
    @IBAction func switchPressed(_ sender: Any) {
        print ("hello")
        if Switch.isOn
        {

                let content = UNMutableNotificationContent()
                content.title = "You have tasks to complete!"
                content.subtitle = ""
                content.body = "Joshua Shou is a genius omg"
                let alarmTime = Date().addingTimeInterval(60)
                let components = Calendar.current.dateComponents([.weekday,
                                                                  .hour, .minute], from: alarmTime)
                let trigger = UNCalendarNotificationTrigger(dateMatching:
                    components, repeats: true)
                let request = UNNotificationRequest(identifier:
                    "taskreminder", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }

        else
        {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
        
        
    }
   

    @IBAction func changepic(_ sender: Any) {
    
    
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated:true, completion:nil)
    }
    
    
        


    
    
    
    
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any]){
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        profpic.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true // Large title
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
