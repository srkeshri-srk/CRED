//
//  BankInfoTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class BankInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        artworkImageView.layer.cornerRadius = 15.0
        artworkImageView.layer.masksToBounds = true
        
        selectionButton.layer.cornerRadius = selectionButton.bounds.size.height / 2
        selectionButton.layer.borderWidth = 1.0
        selectionButton.layer.borderColor = UIColor.gray.cgColor
        
        titleLabel.textColor = UIColor.white
        subTitleLabel.textColor = UIColor.white
    }

    @IBAction func selectionButtonAction(_ sender: UIButton) {
        selectionButton.isSelected = !selectionButton.isSelected
        
        if selectionButton.isSelected {
            selectionButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        } else {
            selectionButton.setImage(nil, for: .normal)
        }
    }
    
}
