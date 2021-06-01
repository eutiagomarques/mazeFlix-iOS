//
//  SeriesController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation
import UIKit
import SwiftyJSON

class SeriesController: UITableViewController {
    
    // MARK: - Properties    
    var apiPage = 1
    var showList: [Show] = []
    let spinner = SpinnerViewController()
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        startSpinner()
        getSeries(page: apiPage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table Lifecycle
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath)
        cell.textLabel?.text = showList[indexPath.row].name        
        
        return cell
    }
    
    
    
    
    //MARK: - Requests
    func getSeries(page: Int){
        
        let url = URL(string: Constants.baseUrl + "shows?page=\(page)" )
        
        let tarefa = URLSession.shared.dataTask(with: url!) { [self] (response, request, erro) in
            if erro == nil {
                if response != nil {
                    do{
                        let shows: [Show] = try! JSONDecoder().decode([Show].self, from: response!)
                        shows.forEach { (show) in
                            showList.append(show)                            
                        }
                        tableView.reloadData()
                        stopSpinner()
                    }
                }else {
                    print("Empty Response")
                }
                
            }else {
                print("Request Error")
            }
        }
        tarefa.resume()
    }
    
    func startSpinner(){
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func stopSpinner(){
        spinner.willMove(toParent: nil)
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
}
