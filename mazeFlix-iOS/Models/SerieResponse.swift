//
//  SerieResponse.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 04/06/21.
//

import Foundation

class SerieResponse {
    let series: [SerieData]
    
    
    init(seriesData: [SerieData]) {
        self.series = seriesData
    }
}
