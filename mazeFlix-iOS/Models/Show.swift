//
//  Show.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation

struct Show: Decodable {
    var id : Int?
    var name: String?
    var image: Image?
    var schedule: Schedule?
    var genres: [String]?
    var sumary: String?    
}
