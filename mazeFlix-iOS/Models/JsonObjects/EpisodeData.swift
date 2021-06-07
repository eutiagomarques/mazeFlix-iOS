//
//  EpisodeData.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation

struct EpisodeData: Decodable {
    var id : Int?
    var name: String?
    var season : Int?
    var number : Int?
    var image: ImageData?
    var summary: String?
}
