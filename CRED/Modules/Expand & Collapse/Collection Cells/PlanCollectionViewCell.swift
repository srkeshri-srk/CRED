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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    @IBOutlet weak var seeCalculationsButton: UIButton!
    
    let colorPalettes: [UIColor] = [.charlestonGreen, .cola, .crayola, .deer, .jacarta, .policeBlue]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        planView.layer.cornerRadius = 10.0
        planView.layer.masksToBounds = true
        planView.backgroundColor = colorPalettes.randomElement() ?? .cola

        recommendedView.layer.cornerRadius = recommendedView.bounds.size.height / 2
        recommendedView.layer.masksToBounds = true
        recommendedView.isHidden = [true, false].randomElement() ?? false
        
        selectionButton.layer.cornerRadius = selectionButton.bounds.size.height / 2
        selectionButton.layer.borderWidth = 1
        selectionButton.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
    }
    
    @IBAction func selectionButtonAction(_ sender: UIButton) {
        selectionButton.isSelected = !selectionButton.isSelected
        
        if selectionButton.isSelected {
            selectionButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            selectionButton.setImage(nil, for: .normal)
        }
    }
    
    @IBAction func seeCalculationsButtonAction(_ sender: UIButton) {
        //Handle for See calculations
    }
    
}
