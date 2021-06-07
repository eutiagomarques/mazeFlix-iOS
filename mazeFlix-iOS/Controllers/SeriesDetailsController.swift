//
//  SeriesDetailsController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 04/06/21.
//

import Foundation
import UIKit
import SDWebImage

protocol SeriesDetailsControllerDelegate {
    func showEpisodes(_ show: ShowData)
}

class SeriesDetailsController: UIViewController, SeriesControllerDelegate{
    
    
    // MARK: - Properties  
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var sumaryLabel: UITextView!
    @IBOutlet weak var episodesButton: UIButton!
    var showDetails: ShowData = ShowData()
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Delegate Function 
    func showDetails(_ show: ShowData) {
        showDetails = show        
    }

    
    // MARK: - Setup View Elements    
    func setupView(){
        setupNameLabel()
        setupImageView()
        setupScheduleLabel()
        setupGenresLabel()
        setupSumaryLabel()
        setupButton()
    }
    
    
    fileprivate func setupNameLabel() {
        nameLabel.text = showDetails.name
    }
    
    fileprivate func setupImageView() {
        let showImageUrl = URL(string: showDetails.image?.medium ?? "https://icon-library.com/images/image-error-icon/image-error-icon-21.jpg")
        showImageView.sd_setImage(with: showImageUrl, placeholderImage: UIImage(named: "loading"), completed: nil)
    }
   
    fileprivate func setupScheduleLabel() {
        if(showDetails.schedule?.time != nil && showDetails.schedule?.days != nil){
            let time = showDetails.schedule?.time.description ?? ""
            var days = String()
            showDetails.schedule?.days!.forEach({ (day) in
                days.append("\(day) ")
            })
            
            let formattedDays = days.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: ", ")
            let fullTextSchedule = "Displayed on day(s): \(formattedDays) at: \(String(describing: time))"
            
            
            scheduleLabel.text = fullTextSchedule
            if (scheduleLabel.text == "" || scheduleLabel.text == nil){
                scheduleLabel.text = "Schedule Not Informed"
            }
        }
    }
    
    fileprivate func setupGenresLabel() {
        if (showDetails.genres != nil){
            
            var genres = String()
            showDetails.genres!.forEach({ (genre) in
                genres.append("\(genre) ")
            })
            
            let formattedGenres = genres.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: ", ")
            genreLabel.text = formattedGenres
            if (genreLabel.text == "" || genreLabel.text == nil){
                genreLabel.text = "Genre Not Informed"
            }
        }
    }
    
    fileprivate func setupSumaryLabel(){
        do {
            try sumaryLabel.text = showDetails.summary?.htmlAttributedString()
            sumaryLabel.scrollRangeToVisible(NSMakeRange(0, 0))
            if (sumaryLabel.text == "" || sumaryLabel.text == nil){
                sumaryLabel.text = "Summary Not Informed"
            }
        } catch {
            sumaryLabel.text = "Data Error"
        }
          
    }
    
    private func setupButton(){
        episodesButton.setTitle("Episodes Info", for: UIControl.State.normal)
        episodesButton.tintColor = Constants.orangeDefaultColor
        episodesButton.layer.borderWidth = 3.0
        episodesButton.layer.borderColor = Constants.orangeDefaultColor.cgColor
        episodesButton.layer.cornerRadius = 10.0
    }
    
    // MARK: - Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "episodesList"){
            let episodesController = segue.destination as! EpisodesController
            episodesController.showEpisodes(showDetails)
        }        
    }
}
