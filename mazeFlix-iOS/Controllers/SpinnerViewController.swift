//
//  SpinnerViewController.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 01/06/21.
//

import Foundation
import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.6)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
//    func startSpinner(){
//        addChild(spinner)
//        spinner.view.frame = view.frame
//        view.addSubview(spinner.view)
//        spinner.didMove(toParent: self)
//    }
    
//    func stopSpinner(){
//        spinner.willMove(toParent: nil)
//        spinner.view.removeFromSuperview()
//        spinner.removeFromParent()
//    }
}

