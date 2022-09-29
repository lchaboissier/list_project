//
//  BeerApi.swift
//  ApiPractice

import Alamofire
import SwiftyJSON
import PromiseKit

class BeerApi {
    
    //Fonction static pour ne pas a avoir a l'instancier a chaque fois qu'on veux la call
    static func getBeers() -> Promise<[Beer]> {
        var beers: [Beer] = []
        
        // Gestion de l'asynchrone, on retourne une promesse
        return Promise { seal in
            
            // On fait l'appel dans la promesse
            AF.request("https://api.punkapi.com/v2/beers").response { response in
               let json = JSON(response.data)
                let beersJSON = json.arrayValue
                for beer in beersJSON {
                    beers.append(Beer(name: beer["name"].stringValue,
                                           degree: beer["abv"].stringValue,
                                           description: beer["description"].stringValue,
                                           pictureUrl: beer["image_url"].stringValue)
                    )
                }
                // on retourne le resultat de la promesse
                seal.fulfill(beers)
            }
        }
    }
}
