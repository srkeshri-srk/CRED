//
//  HomeViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 27/11/23.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Home.title)
        
        ctaButton.layer.cornerRadius = 12.0
        ctaButton.layer.masksToBounds = true
        ctaButton.backgroundColor = .white
        ctaButton.tintColor = .vampireBlack
        descriptionLabel.textColor = .white
    }
    
    @IBAction func ctaButtonAction(_ sender: UIButton) {        
        let expandAndCollapseVC = ExpandAndCollapseViewController()
        expandAndCollapseVC.modalPresentationStyle = .fullScreen
        expandAndCollapseVC.viewModel.setupFirstVC()
        
        // keep false animation will be handled in VC itself.
        self.present(expandAndCollapseVC, animated: false)
    }
    
}
