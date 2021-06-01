//
//  MainController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 31/05/21.
//

import UIKit

class MainController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var btnGoSeriesView: UIButton!
    @IBOutlet weak var labelWelcomeMessage: UILabel!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewElements()
        
    }
    
    // MARK: - Layout
    private func setupViewElements(){
        setupLabels()
        setupButtons()
        setupNavigationBar()
    }
    
    private func setupButtons(){
        btnGoSeriesView.setTitle("Go To Series", for: UIControl.State.normal) 
        btnGoSeriesView.tintColor = Constants.orangeDefaultColor
        btnGoSeriesView.layer.borderWidth = 3.0
        btnGoSeriesView.layer.borderColor = Constants.orangeDefaultColor.cgColor
        btnGoSeriesView.layer.cornerRadius = 15.0
    }
    
    private func setupLabels(){
        labelWelcomeMessage.text = "Welcome to MazeFlix"
        labelWelcomeMessage.textColor = Constants.grayDefaultColor
        labelWelcomeMessage.font = UIFont(name: "HiraMaruPro-W4", size: 19)
        labelWelcomeMessage.textAlignment = .center
    }
    
    private func setupNavigationBar(){
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: Constants.orangeDefaultColor]
    }
}

