//
//  BaseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Color.viewControllerBG
    }
    
    
    func setNavBar(title value: String) {
        title = value
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // prevent Nav Bar color change on scroll view push behind NavBar
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = Constants.Color.viewControllerBG

        self.navigationController?.navigationBar.standardAppearance = standardAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = standardAppearance
    }


}
