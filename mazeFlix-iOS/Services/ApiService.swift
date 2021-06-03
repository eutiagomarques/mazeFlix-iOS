//
//  ApiService.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 03/06/21.
//

import Foundation

class ApiService {
    
    
    func getSeries(page: Int) -> [Show]{
        var showsData: [ShowData] = []
        var showsList: [Show] = []
        let semaphore = DispatchSemaphore(value: 0)
        let url = URL(string: Constants.baseUrl + "shows?page=\(page)" )
        let task = URLSession.shared.dataTask(with: url!) {(response, request, erro) in
            if erro == nil {
                if response != nil {
                    do{
                        showsData = try! JSONDecoder().decode([ShowData].self, from: response!)
                        showsData.forEach { (show) in
                            showsList.append(Show(dataObj: show))
                        }
                        semaphore.signal()
                    }
                }
            }
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        return showsList
    }
    
}
