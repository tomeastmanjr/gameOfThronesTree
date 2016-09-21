//
//  ViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    @IBOutlet weak var randomCharLabel1: UILabel!
    @IBOutlet weak var randomCharLabel2: UILabel!
    @IBOutlet weak var randomCharLabel3: UILabel!
    @IBOutlet weak var randomCharLabel4: UILabel!

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let random = Int(arc4random_uniform(UInt32(101))+1)
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        randomCharLabel1.text = String(Int(arc4random_uniform(UInt32(585))+1))
        randomCharLabel2.text = String(Int(arc4random_uniform(UInt32(585))+1))
        randomCharLabel3.text = String(Int(arc4random_uniform(UInt32(585))+1))
        randomCharLabel4.text = String(Int(arc4random_uniform(UInt32(585))+1))
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

