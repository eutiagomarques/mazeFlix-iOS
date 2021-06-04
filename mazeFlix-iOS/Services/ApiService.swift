//
//  ApiService.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 03/06/21.
//

import Foundation

struct ApiService {
    
    func getSeriesData(page: Int, completionHandler: @escaping (ShowResponse?) -> ()) {
        
        let url =  URL(string: Constants.baseUrl + "shows?page=\(page)")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil)
            {
                do {
                    let showsData = try JSONDecoder().decode([ShowData].self, from: data!)
                    let result = ShowResponse(showsData: showsData)
                    completionHandler(result)

                } catch let error {
                    debugPrint(error)
                }
            }
        }.resume()
    }
    
    func searchSeries(searchTerm: String, completionHandler: @escaping (SerieResponse?) -> ()) {
        let term = searchTerm.replacingOccurrences(of: " ", with: "")
        print(term)
        let url =  URL(string: Constants.baseUrl + "search/shows?q=\(term)")

        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if(error == nil && data != nil)
            {
                do {
                    let serieData = try JSONDecoder().decode([SerieData].self, from: data!)
                    let result = SerieResponse(seriesData: serieData)
                    completionHandler(result)

                } catch let error {
                    debugPrint(error)
                }
            }
        }.resume()
    }
    
}
