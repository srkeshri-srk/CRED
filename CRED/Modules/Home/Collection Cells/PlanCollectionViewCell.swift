//
//  PlanCollectionViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 27/11/23.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var planView: UIView!
    @IBOutlet weak var recommendedView: UIView!
    @IBOutlet weak var planTopLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        planView.layer.cornerRadius = 10.0
        planView.layer.masksToBounds = true

        recommendedView.layer.cornerRadius = recommendedView.bounds.size.height / 2
        recommendedView.layer.masksToBounds = true
    }

}