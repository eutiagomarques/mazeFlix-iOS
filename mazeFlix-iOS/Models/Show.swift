//
//  Show.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 03/06/21.
//

import Foundation
import UIKit
import SDWebImage

class Show {
    var id : Int?
    var name: String?
    var image: UIImageView = UIImageView()
    var time: String
    var days: [String]
    var genres: [String]?
    var sumary: String?
    
    init (dataObj: ShowData){
        self.id = dataObj.id
        self.name = dataObj.name
        self.image.sd_setImage(with: URL(string: (dataObj.image?.medium)!), completed: nil)
        self.time = (dataObj.schedule?.time!)!
        self.days = (dataObj.schedule?.days!)!
        self.genres = dataObj.genres
        self.sumary = dataObj.sumary        
    }
}
