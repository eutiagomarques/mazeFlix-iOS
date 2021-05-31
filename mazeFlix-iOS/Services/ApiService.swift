//
//  ApiService.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation
import SwiftyJSON
import Alamofire

class ApiService {
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Accept": "application/json"
    ]
    
    let baseUrl = "http://api.tvmaze.com/"
    
    // MARK: - GET Search
    func searchSeries(searchTerm: String) {
        let url = baseUrl + "search/shows?q=\(searchTerm)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let seriesList: [Serie] = try! JSONDecoder().decode([Serie].self, from: response.data!)
                    // CÓDIGO DE SUCESSO DA API
                    
                    break
                case .failure(let error):
                    print(error)
                    break
                }
        }
    }
    
    // MARK: - GET By Page
    func getSeriesByPage(page: Int) {
        let url = baseUrl + "shows?page=\(page)"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let showList: [Show] = try! JSONDecoder().decode([Show].self, from: response.data!)
                    // CÓDIGO DE SUCESSO DA API
                    
                    break
                case .failure(let error):
                    print(error)
                    break
                }
        }
    }
    
    // MARK: - GET Episodios By Series Id
    func getEpisodesBySeriesId(id: Int) {
        let url = baseUrl + "shows/\(id)/episodes"
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let episodesList: [Episode] = try! JSONDecoder().decode([Episode].self, from: response.data!)
//                    episodesList.forEach { (episode) in
//
//                    }
                    // CÓDIGO DE SUCESSO DA API
                    break
                case .failure(let error):
                    print(error)
                    break
                }
        }
    }
}