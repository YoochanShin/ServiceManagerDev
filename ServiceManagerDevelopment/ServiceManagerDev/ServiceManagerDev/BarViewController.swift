//
//  BarViewController.swift
//  ServiceManagerDevRe
//
//  Created by Yoochan Shin on 2018/7/15.
//  Copyright © 2018 CISSDev. All rights reserved.
//

import UIKit

class BarViewController: UITableViewController, RequestViewControllerDelegate {
    
    func requestViewControllerDidCancel(_ controller: RequestViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func requestViewController(_ controller: RequestViewController, didFinishRequest item: ServiceItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    var items: [ServiceItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ServiceItem]()
        
        let row0item = ServiceItem()
        row0item.name = "Back to School Bash"
        row0item.requestor = "Ms. L. Lewis"
        row0item.organization = "Ambassadors"
        row0item.when = "8/27/2018 | 11:30 AM ~ 4:00 PM"
        row0item.number = "3/10"
        row0item.reward = "5 hours"
        items.append(row0item)
        
        let row1item = ServiceItem()
        row1item.name = "Freshman Biology Study Session"
        row1item.requestor = "Mr. T. Gordon"
        row1item.organization = "SNHS"
        row1item.when = "9/5/2018 | 3:00 ~ 5:00 PM"
        row1item.number = "2/5"
        row1item.reward = "2 hours"
        items.append(row1item)
        
        let row2item = ServiceItem()
        row2item.name = "Huge Grace Dental Trip"
        row2item.requestor = "Anna W."
        row2item.organization = "Huge Grace Orphanage"
        row2item.when = "9/15/2018 | 7:00 AM ~ 12:00 PM"
        row2item.number = "12/15"
        row2item.reward = "5 hours"
        items.append(row2item)
        
        let row3item = ServiceItem()
        row3item.name = "United Herald Uni Shoot"
        row3item.requestor = "Alice Y."
        row3item.organization = "SMS"
        row3item.when = "9/17/2018 | 5:00 ~ 8:00 PM"
        row3item.number = "4/10"
        row3item.reward = "3 hours"
        items.append(row3item)
        
        let row4item = ServiceItem()
        row4item.name = "MS Geo Tutoring"
        row4item.requestor = "Anonymous"
        row4item.organization = "Student"
        row4item.when = "9/18/2018 | 3:30 ~ 5:30 PM"
        row4item.number = "0/1"
        row4item.reward = "120 Yuan"
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true // Large title
        tableView.rowHeight = 100
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureText (for cell: UITableViewCell, with item: ServiceItem) {
        
        let name = cell.viewWithTag(1) as! UILabel
        let requestor = cell.viewWithTag(2) as! UILabel
        let organization = cell.viewWithTag(3) as! UILabel
        let when = cell.viewWithTag(4) as! UILabel
        let number = cell.viewWithTag(5) as! UILabel
        let reward = cell.viewWithTag(6) as! UILabel
        name.text = item.name
        requestor.text = item.requestor
        organization.text = item.organization
        when.text = item.when
        number.text = item.number
        reward.text = item.reward
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
