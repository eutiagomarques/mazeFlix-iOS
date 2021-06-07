//
//  EpisodesResponse.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 05/06/21.
//

import Foundation

class EpisodesResponse {
    let episodes: [EpisodeData]
    
    
    init(episodesData: [EpisodeData]) {
        self.episodes = episodesData
    }
}
