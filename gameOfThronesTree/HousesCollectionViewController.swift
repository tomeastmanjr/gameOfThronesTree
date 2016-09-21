//
//  HousesCollectionViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit

private let reuseIdentifier = "houseCell"

class HousesCollectionViewController: UICollectionViewController {
    var houses = [House]()

    override func viewDidLoad() {
        super.viewDidLoad()
        House.getAllHouses{(houses : [House]) in
            houses
            DispatchQueue.main.async(execute: {
                self.collectionView?.reloadData()
            })
        }
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHouseDetails" {
            let indexPath = collectionView?.indexPath(for: sender as! UICollectionViewCell)
            let controller = segue.destination as! HouseDetailsViewController
            controller.house = houses[(indexPath?.row)!]
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }

    // MARK: UICollectionViewDataSource ***************************************************************************************************************************************

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houses.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HouseCell
        cell.houseLabel.text? = houses[indexPath.row].name
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toHouseDetails", sender: collectionView.cellForItem(at: indexPath))
    }

}
