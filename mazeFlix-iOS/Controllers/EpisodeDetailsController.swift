//
//  EpisodeDetailsController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 05/06/21.
//

import Foundation
import UIKit

class EpisodeDetailsController: UIViewController, EpisodesControllerDelegate {
    
    // MARK: - Properties 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var seasonText: UILabel!
    @IBOutlet weak var numberText: UILabel!
    @IBOutlet weak var summaryText: UITextView!    
    var episodeDetails: EpisodeData? = nil
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewElements()
    }
    
    
    // MARK: - Delegate Function 
    func showDetails(_ episode: EpisodeData) {
        episodeDetails = episode
    }
    
    
    // MARK: - Setup View Elements
    func setupViewElements(){
        setupImageView()
        setupNameText()
        setupSeasonText()
        setupNumberText()
        setupSummaryText()
    }
    
    
    fileprivate func setupImageView() {
        let showImageUrl = URL(string: episodeDetails?.image?.medium ?? "https://bitsofco.de/content/images/2018/12/broken-1.png")
        imageView.sd_setImage(with: showImageUrl, placeholderImage: UIImage(named: "loading"), completed: nil)
    }
    
    fileprivate func setupNameText() {
        nameText.text = episodeDetails?.name
        if (nameText.text == "" || nameText.text == nil){
            nameText.text = "Name Not Informed"
        }
    }
    
    fileprivate func setupSeasonText() {
        seasonText.text = "\(episodeDetails?.season ?? 0)"
        if (seasonText.text == "" || seasonText.text == "\(0)"){
            seasonText.text = "Season Not Informed"
        }
    }
    
    fileprivate func setupNumberText() {
        numberText.text = "\(episodeDetails?.number ?? 0)"
        if (numberText.text == "" || numberText.text == "\(0)"){
            numberText.text = "Number Not Informed"
        }
    }
    
    fileprivate func setupSummaryText() {
        do {
            try
                summaryText.text = episodeDetails?.summary?.htmlAttributedString()
            summaryText.scrollRangeToVisible(NSMakeRange(0, 0))
            if (summaryText.text == "" || summaryText.text == nil){
                summaryText.text = "Summary Not Informed"
            }
        } catch {
            summaryText.text = "Data Error"
        }
    }
}
