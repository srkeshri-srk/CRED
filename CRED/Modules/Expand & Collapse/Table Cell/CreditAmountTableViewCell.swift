//
//  CreditAmountTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class CreditAmountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    
    private func setupUI() {
        outerView.layer.cornerRadius = 15.0
        outerView.layer.masksToBounds = true
    }

    
}
