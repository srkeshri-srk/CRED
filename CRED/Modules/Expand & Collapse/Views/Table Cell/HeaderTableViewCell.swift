//
//  HeaderTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 29/11/23.
//

import UIKit

struct HeaderInfo {
    let titleText: String
    let subTitleText: String
}

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var downButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.textColor = .white.withAlphaComponent(0.8)
        subTitleLabel.textColor = .white.withAlphaComponent(0.6)
        downButton.isHidden = true
    }
    
    func configureUI(info: HeaderInfo, isDownButton: Bool = true) {
        titleLabel.text = info.titleText
        subTitleLabel.text = info.subTitleText
        downButton.isHidden = isDownButton
    }
}
