//
//  House.swift
//  gameOfThronesTree
//
//  Created by James Taylor on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

//
//  Person.swift
//  starWarsEncyclopediaV2
//
//  Created by James Taylor on 9/19/16.
//  Copyright © 2016 James Taylor. All rights reserved.
//

import Foundation

class House {
    let name : String
    let region : String
    let coatOfArms : String
    let words : String
    let ancestralWeapons : [String?]?
    let swornMembers : [String?]?

    
    init (name : String?, region : String = "", coatOfArms : String = "", words : String = "", ancestralWeapons : [String], swornMembers : [String]){
        self.name = name!
        self.region = region
        self.coatOfArms = coatOfArms
        self.words = words
        self.ancestralWeapons = ancestralWeapons
        self.swornMembers = swornMembers
    }
    
    static func getAllHouses(completionHandler : @escaping (_ houses : [House]) -> () ){
        var outHouses = [House]()
            print("executing JSON requests")
            let url = NSURL(string: "http://www.anapioficeandfire.com/api/houses")
            let session = URLSession.shared // Create an NSURLSession to handle the request tasks
            let task = session.dataTask(with: url! as URL, completionHandler: {//request data from a URL, requires a completion handler
                data, response, error in
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray {
                        for i in 0 ..< (jsonResult.count) { // now we can run NSArray methods like .count
                            let houseDictionary = jsonResult.object(at: i) as! NSDictionary
                            let name = houseDictionary["name"] as? String
                            let region = houseDictionary["region"] as? String
                            let coatOfArms = houseDictionary["coatOfArms"] as? String
                            let words = houseDictionary["words"] as? String
                            let ancestralWeapons = houseDictionary["ancestralWeapons"] as? [String]
                            let swornMembers = houseDictionary["swornMembers"] as? [String]
                            let h = House(name: name!, region: region!, coatOfArms: coatOfArms!, words: words!, ancestralWeapons: ancestralWeapons!, swornMembers: swornMembers!)
                            print("Appending house: \(h.name)")
                            outHouses.append(h)
                        }
                        print("Current houses: \(outHouses)")
                        completionHandler(outHouses)
                    
                    }
                } catch {
                    print("Something went wrong")
                }
            })
        task.resume()
    }
}
