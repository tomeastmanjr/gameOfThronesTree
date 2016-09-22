//
//  HouseDetailsViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit

class HouseDetailsViewController: UIViewController {
    
    var house : House?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = house?.name
        regionLabel.text = house?.region
        coatOfArmsLabel.text = house?.coatOfArms
        wordsLabel.text = house?.words
        if house?.ancestralWeapons?.count == 0 {
            ancestralWeaponsLabel.text?.append(" None listed")
        } else {
            for weapon in (house?.ancestralWeapons)! {
                ancestralWeaponsLabel.text?.append(" \(weapon!) ")
            }
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var ancestralWeaponsLabel: UILabel!


}
