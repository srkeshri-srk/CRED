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
}

protocol ExpandAndCollapseProtocol {
    var cellTypes: [TableCell] { get set }
    
    func setupFirstVC()
    func setupSecondVC()
    func setupThirdVC()
}

class ExpandAndCollapseViewModel: ExpandAndCollapseProtocol {
    var cellTypes: [TableCell] = []
    
    func setupFirstVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.creditAmount)
    }
    
    func setupSecondVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.plans)
        cellTypes.append(.buttonClip("Click Here"))
    }
    
    func setupThirdVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")))
        cellTypes.append(.bankInfo)
        cellTypes.append(.buttonClip("Click Here"))
    }
}
