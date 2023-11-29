//
//  ExpandAndCollapseViewModel.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import Foundation

enum TableCell {
    case header(HeaderInfo)
    case creditAmount
    case plans
    case buttonClip(String)
    case bankInfo
    
    var heightOfCell: CGFloat {
        switch self {
        case .header(_):
            return 100.0
        case .creditAmount:
            return 400.0
        case .plans:
            return 250.0
        case .buttonClip(_):
            return 80.0
        case .bankInfo:
            return 75.0
        }
    }
}

protocol ExpandAndCollapseProtocol {
    var cellTypes: [TableCell] { get set }
    var ctaButtonTitle: String? { get set }
    var buttonTag: Int { get set }
}

class ExpandAndCollapseViewModel: ExpandAndCollapseProtocol {
    var cellTypes: [TableCell] = []
    var ctaButtonTitle: String?
    var buttonTag: Int = 0 {
        didSet {
            setupNextUI()
        }
    }

    func setupNextUI() {
        if buttonTag == 3 {
            setupUIForFirstVC()
        } else if buttonTag == 2 {
            setupUIForSecondVC()
        } else {
            setupUIForThirdVC()
        }
    }
    
    func setupUIForFirstVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(Constants.ExpandAndCollapse.FirstView.headerInfo))
        cellTypes.append(.creditAmount)
        ctaButtonTitle = Constants.ExpandAndCollapse.FirstView.ctaButtonTitle
    }
    
    func setupUIForSecondVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(Constants.ExpandAndCollapse.SecondView.headerInfo))
        cellTypes.append(.plans)
        cellTypes.append(.buttonClip(Constants.ExpandAndCollapse.SecondView.buttonClip))
        ctaButtonTitle = Constants.ExpandAndCollapse.SecondView.ctaButtonTitle
    }
    
    func setupUIForThirdVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(Constants.ExpandAndCollapse.ThirdView.headerInfo))
        cellTypes.append(.bankInfo)
        cellTypes.append(.buttonClip(Constants.ExpandAndCollapse.ThirdView.buttonClip))
        ctaButtonTitle = Constants.ExpandAndCollapse.ThirdView.ctaButtonTitle
    }
}
