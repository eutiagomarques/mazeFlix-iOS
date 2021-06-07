//
//  SeasonResponse.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 05/06/21.
//

import Foundation
// number of seasons

class SeasonResponse {
    let seasons: [SeasonData]
    
    
    init(seasons: [SeasonData]) {
        self.seasons = seasons
    }
}
