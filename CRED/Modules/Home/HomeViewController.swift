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
        let storyBoard = UIStoryboard(name: "ExpandAndCollapse", bundle: nil)
        let expandAndCollapseViewController = storyBoard.instantiateViewController(withIdentifier: "ExpandAndCollapseViewController") as! ExpandAndCollapseViewController
        self.present(expandAndCollapseViewController, animated: true)
    }
    
    
}
