//
//  RequestViewController.swift
//  ServiceManagerDevRe
//
//  Created by Yoochan Shin on 2018/7/17.
//  Copyright © 2018 CISSDev. All rights reserved.
//

import UIKit

protocol RequestViewControllerDelegate : class {
    func requestViewControllerDidCancel(_ controller: RequestViewController)
    func requestViewController(_ controller: RequestViewController, didFinishRequest item: ServiceItem)
}

class RequestViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var organization: UIPickerView!
    weak var delegate: RequestViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // Organization Picker
    
    let organizations = ["None", "NHS", "SNHS", "SMS", "Ambassadors", "ES HW Club", "Huge Grace", "Will Foundation", "GIN", "CISSMUN", "Others"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return organizations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return organizations.count
    }
}
