//
//  SeriesDetailsController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 04/06/21.
//

import Foundation
import UIKit
import SDWebImage

class SeriesDetailsController: UIViewController, SeriesControllerDelegate{
    
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var sumaryLabel: UITextView!
    @IBOutlet weak var episodesButton: UIButton!
    
    
    var showDetails: ShowData = ShowData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func showDetails(_ show: ShowData) {
        showDetails = show
        print(show)
    }

    
    func setupView(){
        setupNameLabel()
        setupImageView()
        setupScheduleLabel()
        setupGenresLabel()
        setupSumaryLabel()
    }
    
    
    
    @IBAction func showEpisodesList(_ sender: Any) {
    }
    
    // MARK: - Setup View Elements
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
        }
    }
    
    fileprivate func setupSumaryLabel(){
        do {
            try sumaryLabel.text = showDetails.summary?.htmlAttributedString()            
            sumaryLabel.scrollRangeToVisible(NSMakeRange(0, 0))
        } catch {
            sumaryLabel.text = "Error to convert"
        }
          
    }
    
}
