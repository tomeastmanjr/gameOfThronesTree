//
//  CharacterDetailsViewController.swift
//  gameOfThronesTree
//
//  Created by Tom Eastman on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit
class CharacterDetailsViewController: UITableViewController {
    var characters: [Character] = []
    override func viewDidLoad() {
        Character.getAllChars(url: "http://anapioficeandfire.com/api/characters"){(characters: [Character]) in
            self.characters = characters
            print(characters)
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }

        // Do any additional setup after loading the view.
        }
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people
        return characters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharCell", for: indexPath as IndexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        //        let name = tableView.dequeueReusableCell(withIdentifier: "CharCell1", for: indexPath as IndexPath)
        //        let gender = tableView.dequeueReusableCell(withIdentifier: "CharCell2", for: indexPath as IndexPath)
        //        let culture = tableView.dequeueReusableCell(withIdentifier: "CharCell3", for: indexPath as IndexPath)
        //        let born = tableView.dequeueReusableCell(withIdentifier: "CharCell4", for: indexPath as IndexPath)
        //        let died = tableView.dequeueReusableCell(withIdentifier: "CharCell5", for: indexPath as IndexPath)
        //        let father = tableView.dequeueReusableCell(withIdentifier: "CharCell6", for: indexPath as IndexPath)
        //        let mother = tableView.dequeueReusableCell(withIdentifier: "CharCell7", for: indexPath as IndexPath)
        //        let spouse = tableView.dequeueReusableCell(withIdentifier: "CharCell8", for: indexPath as IndexPath)
        // set the default cell label to the corresponding element in the people array
        //        name.textLabel?.text = characters[indexPath.row].name
        //        gender.textLabel?.text = characters[indexPath.row].gender
        //        culture.textLabel?.text = characters[indexPath.row].culture
        //        born.textLabel?.text = characters[indexPath.row].born
        //        died.textLabel?.text = characters[indexPath.row].died
        //        father.textLabel?.text = characters[indexPath.row].father
        //        mother.textLabel?.text = characters[indexPath.row].mother
        //        spouse.textLabel?.text = characters[indexPath.row].spouse
        
        
        print(cell)
        return cell

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
