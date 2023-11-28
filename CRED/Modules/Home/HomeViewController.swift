//
//  HomeViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 27/11/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Home.title)
    }
    
}
