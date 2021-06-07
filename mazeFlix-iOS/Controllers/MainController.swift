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
    
    // MARK: - Layout Elements
    private func setupViewElements(){
        setupLabel()
        setupButton()
        setupNavigationBar()
    }
    
    private func setupButton(){
        btnGoSeriesView.setTitle("Go To Series", for: UIControl.State.normal) 
        btnGoSeriesView.tintColor = Constants.orangeDefaultColor
        btnGoSeriesView.layer.borderWidth = 3.0
        btnGoSeriesView.layer.borderColor = Constants.orangeDefaultColor.cgColor
        btnGoSeriesView.layer.cornerRadius = 10.0
    }
    
    private func setupLabel(){
        labelWelcomeMessage.text = "Welcome to MazeFlix"
        labelWelcomeMessage.textColor = Constants.grayDefaultColor
        labelWelcomeMessage.font = UIFont(name: "HiraMaruPro-W4", size: 19)
        labelWelcomeMessage.textAlignment = .center
    }
    
    private func setupNavigationBar(){
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.largeTitleTextAttributes  = [.foregroundColor: Constants.orangeDefaultColor]
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = Constants.orangeDefaultColor
    }
}

