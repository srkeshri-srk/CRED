//
//  CreditAmountTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit
import HGCircularSlider

protocol CreditAmountable: AnyObject {
    func sliderValueChanged(value: CGFloat)
}

class CreditAmountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var sliderView: CircularSlider!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var delegate: CreditAmountable?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
        setUpCircularView()
    }

    
    private func setupUI() {
        outerView.layer.cornerRadius = 15.0
        outerView.layer.masksToBounds = true
        
        sliderView.diskFillColor = .white
        sliderView.diskColor = .white
        sliderView.trackFillColor = .middleRed
        sliderView.trackColor = .linen
        sliderView.endThumbStrokeColor = .deepPeach
        sliderView.endThumbTintColor = .blackCoffee
        sliderView.endThumbStrokeHighlightedColor = .middleRed
        sliderView.lineWidth = 14
        sliderView.backtrackLineWidth = 14
        sliderView.numberOfRounds = 1
        sliderView.stopThumbAtMinMax = true
    }
    
    func setUpCircularView(){
        sliderView.minimumValue = 0
        sliderView.maximumValue = 50000
        sliderView.addTarget(self, action: #selector(sliderMoved), for: .valueChanged)
    }

    @objc func sliderMoved() {
        let amount = sliderView.endPointValue
        amountLabel.text = amount.formatted(.currency(code: "INR"))
        delegate?.sliderValueChanged(value: sliderView.endPointValue)
    }
}
