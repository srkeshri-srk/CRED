//
//  CreditAmountTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class CreditAmountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    
    private func setupUI() {
        outerView.layer.cornerRadius = 15.0
        outerView.layer.masksToBounds = true
        
        sliderView.layer.cornerRadius = sliderView.bounds.size.height / 2
        sliderView.layer.borderWidth = 10.0
        sliderView.layer.borderColor = UIColor.deer.cgColor
    }

    
}
