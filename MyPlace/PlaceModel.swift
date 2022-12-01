//
//  PlaceModel.swift
//  MyPlace
//
//  Created by a.koziukin on 23.11.2022.
//

import Foundation
import UIKit


struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var restaurantImage: String?
    
    
   static let restaurantNames = [
        "Dry'n'Wet" , "Roof Bar",
        "Tagiatelle", "More", "ReLab",
        "NaNi", "Casper", "Kontora57",
        "Zero", "Kommunalka Bar", "Top Hop",
        "Sherlock Holmes", "Morris Pub", "X.O"
    ]
    
    static func getPlaces() -> [Place] { 
        
        var places = [Place]()
        
        for place in restaurantNames {
            
            places.append(Place(name: place, location: "Moscow", type: "Bar", image: nil, restaurantImage: place))
        }
        
        return places
    }
}
