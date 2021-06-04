//
//  SeriesController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import Foundation
import UIKit
import SDWebImage

class SeriesController: UIViewController, UITableViewDataSource {
    
    
    // MARK: - Properties    
    var apiPage = 0
    var showList: [ShowData]? = nil
    let api: ApiService = ApiService()
    let spinner = SpinnerViewController()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchInputText: UITextField!
    @IBOutlet weak var previosPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setEnabledButton(value: false)
        getTableData()
    }
    
    // MARK: - TableView LifeCycle
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowCell
        let currentShow = showList![indexPath.row]
        let showImageUrl = URL(string: currentShow.image?.medium ?? "https://icon-library.com/images/image-error-icon/image-error-icon-21.jpg")
        
        cell.showLabelView.text = currentShow.name
        cell.showImageView.sd_setImage(with: showImageUrl, placeholderImage: UIImage(named: "loading"), completed: nil)
        
        setupLabel(tableView: cell)
        setupImageView(tableView: cell)
        return cell
    }
    
    func getTableData(){
        api.getSeriesData(page: apiPage) { (response) in
            if(response?.shows != nil){
                self.showList = response?.shows
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchSeries(term: String) {
        if(term.isEmpty){
            getTableData()
        }else {
            api.searchSeries(searchTerm: term) { (response) in
                if(response?.series != nil){
                    var shows = [ShowData].init()
                    response?.series.forEach({ (serie) in
                        shows.append(serie.show)
                    })
                    self.showList = shows
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            
        }
    }
    
    //MARK: - Buttons Events
    @IBAction func startSearch(_ sender: Any) {
        if(searchInputText.text != nil){
            searchSeries(term: searchInputText.text!)
        }
    }
    
    @IBAction func viewNextPage(_ sender: Any) {
        if(apiPage == 0){
            setEnabledButton(value: true)
        }
        apiPage+=1
        getTableData()
    }
    
    @IBAction func viewPreviousPage(_ sender: Any) {
        if(apiPage == 1){
            setEnabledButton(value: false)
        }
        apiPage-=1
        getTableData()
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
    }
    
    private func setEnabledButton(value: Bool){
        previosPageButton.isEnabled = value
    }    
}
