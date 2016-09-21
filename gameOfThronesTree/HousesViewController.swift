//
//  HousesCollectionViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit

private let reuseIdentifier = "houseCell"

class HousesViewController: UIViewController {
    var houses = [House]()

    override func viewDidLoad() {
        super.viewDidLoad()
        House.getAllHouses{(houses : [House]) in
            houses
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHouseDetails" {
            let controller = segue.destination as! HouseDetailsViewController
            switch (sender as! String) {
            case "lannister": controller.house = houses[0]
            case "stark": controller.house = houses[1]
            case "tyrell": controller.house = houses[2]
            case "martell": controller.house = houses[3]
            case "greyjoy": controller.house = houses[4]
            case "baratheon": controller.house = houses[5]
            default: return
            }
            
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    @IBAction func lannisterButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "lannister")
    }
    @IBAction func starkButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "stark")
    }
    @IBAction func tyrellButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "tyrell")
    }
    @IBAction func martellButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "martell")
    }
    @IBAction func greyjoyButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "greyjoy")
    }
    @IBAction func baratheonButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toHouseDetails" , sender: "baratheon")
    }
}
