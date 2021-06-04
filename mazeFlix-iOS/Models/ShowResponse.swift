//
//  ShowResponse.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 04/06/21.
//

import Foundation

class ShowResponse {
    let shows: [ShowData]
    
    
    init(showsData: [ShowData]) {
        self.shows = showsData
    }
}
