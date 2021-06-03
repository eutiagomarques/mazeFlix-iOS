//
//  SeriesController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation
import UIKit

class SeriesController: UIViewController, UITableViewDataSource {
    
    
    // MARK: - Properties    
    var apiPage = 0
    var showList: [Show] = []
    let api = ApiService.init()
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showList = api.getSeries(page: self.apiPage)
        tableView.reloadData()
    }
    
    // MARK: - TableView LifeCycle
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowCell
        cell.showLabelView.text = showList[indexPath.row].name
        cell.showImageView.image = showList[indexPath.row].image.image
        setupLabel(tableView: cell)
        setupImageView(tableView: cell)
        return cell
    }
    
    
    // MARK: - Setup View Elements
    
    private func setupLabel(tableView: ShowCell){
        tableView.showLabelView.textColor = Constants.orangeDefaultColor
        tableView.showLabelView.font = UIFont(name: "HiraMaruPro-W4", size: 17)
        tableView.showLabelView.textAlignment = .left
    }
    
    private func setupImageView(tableView: ShowCell){
        tableView.showImageView.layer.cornerRadius = 20
        tableView.showImageView.clipsToBounds = true
        tableView.showImageView.layer.backgroundColor = Constants.grayDefaultColor.cgColor
    }
}
