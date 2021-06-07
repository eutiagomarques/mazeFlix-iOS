//
//  EpisodesController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 05/06/21.
//

import Foundation
import UIKit
import SDWebImage

protocol EpisodesControllerDelegate {
    func showDetails(_ episode: EpisodeData)
}

class EpisodesController: UIViewController, UITableViewDataSource, SeriesDetailsControllerDelegate {
    
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var showEpisodes: ShowData = ShowData()
    var episodesList: [EpisodeData]? = nil
    var seasons: [SeasonData]? = nil
    let api: ApiService = ApiService()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        getSeasonsData()
        getTableData()
    }
    
    // MARK: - Delegate Function 
    func showEpisodes(_ show: ShowData) {
        self.showEpisodes = show
    }
    
    
    // MARK: - TableView LifeCycle
    func numberOfSections(in tableView: UITableView) -> Int {
        return seasons?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSeason = seasons?[section]
        return currentSeason?.episodeOrder ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath)
        
        if (indexPath.section == 0){
            let currentEpisode = episodesList?[indexPath.row]
            cell.textLabel?.text = currentEpisode?.name
            return cell
        }else {
                        
            let currentEpisode = getCurrentEpisode(indexPath: indexPath)
            cell.textLabel?.text = currentEpisode.name
            return cell
        }
    }    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var currentSeason = section
        currentSeason+=1
        return "Season \(currentSeason)"
    }
    
    
    // MARK: - Table Data
    func getTableData(){
        api.getSeriesEpisodes(serieID: showEpisodes.id!) { (response) in
            if(response?.episodes != nil){
                self.episodesList = response?.episodes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }        
    }
    
    func getSeasonsData(){
        api.getNumberSeasons(serieID: showEpisodes.id!) { (response) in
            if(response?.seasons != nil){
                self.seasons = response?.seasons
            }
        }
    }
    
    func getCurrentEpisode(indexPath: IndexPath) -> EpisodeData{
        var numberEpisodes: Int = 0
        var indexSeason = 0
        while indexSeason != indexPath.section {
            let currentSeason = seasons?[indexSeason]
            numberEpisodes = numberEpisodes + (currentSeason?.episodeOrder)!
            indexSeason+=1
        }
        
        let finalIndex = indexPath.row + numberEpisodes
        let currentEpisode = (episodesList?[finalIndex])!
        
        return currentEpisode
    }    
    
    
    // MARK: - Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "episodeDetails"){
            if let indexPath = tableView.indexPathForSelectedRow{
                let episodesDetailsController = segue.destination as! EpisodeDetailsController
                
                let currentEpisode = getCurrentEpisode(indexPath: indexPath)
                episodesDetailsController.showDetails(currentEpisode)
            }
        }
    }
}
