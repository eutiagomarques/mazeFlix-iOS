//
//  MainController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import UIKit

class MainController: UIViewController {
    
    let apiService = ApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.searchSeries(searchTerm: "Bang")
    }
        
}

