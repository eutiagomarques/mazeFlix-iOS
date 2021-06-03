//
//  ShowData.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation

struct ShowData: Decodable {
    var id : Int?
    var name: String?
    var image: ImageData?
    var schedule: ScheduleData?
    var genres: [String]?
    var sumary: String?    
}
