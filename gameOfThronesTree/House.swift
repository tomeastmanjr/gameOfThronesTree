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
        let requestedHouses = [229,362,398,285,169,17]
        var i = 0
        func handleJSONGet(stringUrl: String!) {
            let url = NSURL(string: stringUrl)
            let session = URLSession.shared
            let task = session.dataTask(with: url! as URL, completionHandler: {
                data, response, error in
                do {
                    if let houseDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            let name = houseDictionary["name"] as? String
                            let region = houseDictionary["region"] as? String
                            let coatOfArms = houseDictionary["coatOfArms"] as? String
                            let words = houseDictionary["words"] as? String
                            let ancestralWeapons = houseDictionary["ancestralWeapons"] as? [String]
                            let swornMembers = houseDictionary["swornMembers"] as? [String]
                            let h = House(name: name!, region: region!, coatOfArms: coatOfArms!, words: words!, ancestralWeapons: ancestralWeapons!, swornMembers: swornMembers!)
                            print("Appending house: \(h.name)")
                            outHouses.append(h)
                        if i == requestedHouses.count-1 {
                            print("Current houses: \(outHouses)")
                            completionHandler(outHouses)
                        } else {
                            i += 1
                        }
                    }
                    //Put any recursive calls to handelJSONResponse here (i.e. follow-on links)
                } catch {
                    print("something went wrong")
                }
            })
            task.resume()
        }
        for i in 0 ..< requestedHouses.count {
            handleJSONGet(stringUrl: "http://www.anapioficeandfire.com/api/houses/\(requestedHouses[i])")
        }
    }
}
