//
//  FirstViewController.swift
//  ServiceManagerDevRe
//
//  Created by Yoochan Shin on 2018/7/15.
//  Copyright © 2018 CISSDev. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let normalString = Name.text
        
        let attributedText = NSMutableAttributedString(string: normalString!)
        attributedText.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Avenir-Black", size: 50)!], range: getRangeOfSubString(subString: "MASTER", fromString: normalString!)) // Master
        
        attributedText.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "Avenir-Light", size: 50)!], range: getRangeOfSubString(subString: "PLAN", fromString: normalString!)) // Plan
        
        Name.attributedText = attributedText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRangeOfSubString(subString: String, fromString: String) -> NSRange {
        let sampleLinkRange = fromString.range(of: subString)!
        let startPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.lowerBound)
        let endPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.upperBound)
        let linkRange = NSMakeRange(startPos, endPos - startPos)
        return linkRange
    }
    
}
