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
    var buttonTag: Int { get set }
}

class ExpandAndCollapseViewModel: ExpandAndCollapseProtocol {
    var cellTypes: [TableCell] = []
    var buttonTag: Int = 0 {
        didSet {
            setupNextUI()
        }
    }

    func setupNextUI() {
        if buttonTag == 3 {
            setupFirstVC()
        } else if buttonTag == 2 {
            setupSecondVC()
        } else {
            setupThirdVC()
        }
    }
    
    func setupFirstVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.creditAmount)
    }
    
    func setupSecondVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "how do you wish to repay?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.plans)
        cellTypes.append(.buttonClip("create your own plan"))
    }
    
    func setupThirdVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "where should we send the money?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.bankInfo)
        cellTypes.append(.buttonClip("change account"))
    }
}
