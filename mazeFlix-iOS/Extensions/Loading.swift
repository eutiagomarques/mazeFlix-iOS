//
//  Loading.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 06/06/21.
//

import Foundation
import UIKit


extension UIViewController {
    func startLoading() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Please Wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50 ))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        return alert
    }
    
    func stopLoading(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }
}
