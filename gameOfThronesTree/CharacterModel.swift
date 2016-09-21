//
//  CharacterModel.swift
//  gameOfThronesTree
//
//  Created by Ryan Brennan on 9/21/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import Foundation
class Character{
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let father: String
    let mother: String
    let spouse: String
    init(name: String, gender: String, culture: String, born: String, died: String, father: String, mother: String, spouse: String){
        self.name = name
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.father = father
        self.mother = mother
        self.spouse = spouse
    }
    static func getAllChars(url: String, thechars: [Character] = [], comp:@escaping (_ persons: [Character])->()){
        let url = URL(string: url)
        // Create an NSURLSession to handle the request tasks
        let session = URLSession.shared
        // Create a "data task" which will request some data from a URL and then run a completion handler after it is done
        let task = session.dataTask(with: url! as URL, completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    var thechars = thechars
                    if let results = jsonResult["characters"]{
                        let resultsArray = results as! [[String: Any]]
                        for result in resultsArray{
                            let people = Character(name: result["name"] as! String, gender: result["gender"] as! String, culture: result["culture"] as! String, born: result["born"] as! String, died: result["died"] as! String, father: result["father"] as! String, mother: result["mother"] as! String, spouse: result["spouse"] as! String)
                            thechars.append(people)
                        }
                        if let pageNext = jsonResult["url"]{
                            if (pageNext as? String) != nil{
                                self.getAllChars(url: pageNext as! String, thechars: thechars, comp: comp)
                            }else{
                                comp(thechars)
                            }
                        }
                        print(resultsArray.count)
                        print(resultsArray)
                        print(thechars)
                    }
                }
            }catch{
                print("Something went wrong")
            }
        })
        task.resume()
    }
}
