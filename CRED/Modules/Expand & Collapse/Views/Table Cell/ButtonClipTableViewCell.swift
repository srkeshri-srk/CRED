//
//  ButtonClipTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ButtonClipTableViewCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        button.tintColor = .gray
        button.backgroundColor = .clear
        button.layer.cornerRadius = button.bounds.size.height / 2
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.masksToBounds = true
    }
    
    func configureUI(title: String) {
        button.setTitle(title, for: .normal)
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        //Handle Button Action
    }
    
}
