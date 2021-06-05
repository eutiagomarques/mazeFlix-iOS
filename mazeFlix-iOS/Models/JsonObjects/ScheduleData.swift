//
//  ScheduleData.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation

struct ScheduleData: Decodable {
    var time: String
    var days: [String]?
}
