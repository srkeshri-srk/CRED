//
//  ExpandAndCollapseViewModel.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import UIKit


enum TableCell {
    case header(info: HeaderInfo, isDownButton: Bool? = true, font: (title: UIFont, subTitle: UIFont))
    case creditAmount
    case plans
    case buttonClip(title: String)
    case bankInfo
    
    var heightOfCell: CGFloat {
        switch self {
        case .header(_, _, _):
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
    var creditAmount: CGFloat { get set }
    
    func setupExpandUI()
    func setupCollapseUI()
    
}

class ExpandAndCollapseViewModel: ExpandAndCollapseProtocol {
    //MARK: - Variables
    var cellTypes: [TableCell] = []
    var ctaButtonTitle: String?
    var buttonTag: Int = 0
    var creditAmount: CGFloat = 0
    
    private let expandFont = (UIFont.systemFont(ofSize: 20.0), UIFont.systemFont(ofSize: 13.0))
    private let collapseFont = (UIFont.systemFont(ofSize: 15.0),UIFont.systemFont(ofSize: 28.0))

    
    //MARK: - Methods
    func setupExpandUI() {
        if buttonTag == 3 {
            setupExpandUIForFirstVC()
        } else if buttonTag == 2 {
            setupExpandUIForSecondVC()
        } else {
            setupExpandUIForThirdVC()
        }
    }
    
    func setupCollapseUI() {
//        if buttonTag == 2 {
            setupCollapseUIForFirstVC()
//        } else if buttonTag == 1 {
//            setupCollapseUIForSecondVC()
//        } else {
//            setupCollapseUIForThirdVC()
//        }
    }
    
    
    private func setupExpandUIForFirstVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: Constants.ExpandAndCollapse.FirstView.headerInfo, font: expandFont))
        cellTypes.append(.creditAmount)
        ctaButtonTitle = Constants.ExpandAndCollapse.FirstView.ctaButtonTitle
    }
    
    private func setupExpandUIForSecondVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: Constants.ExpandAndCollapse.SecondView.headerInfo, font: expandFont))
        cellTypes.append(.plans)
        cellTypes.append(.buttonClip(title: Constants.ExpandAndCollapse.SecondView.buttonClip))
        ctaButtonTitle = Constants.ExpandAndCollapse.SecondView.ctaButtonTitle
    }
    
    private func setupExpandUIForThirdVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: Constants.ExpandAndCollapse.ThirdView.headerInfo, font: expandFont))
        cellTypes.append(.bankInfo)
        cellTypes.append(.buttonClip(title: Constants.ExpandAndCollapse.ThirdView.buttonClip))
        ctaButtonTitle = Constants.ExpandAndCollapse.ThirdView.ctaButtonTitle
    }
    
    private func setupCollapseUIForFirstVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: HeaderInfo(titleText: "credit amount", subTitleText: creditAmount.formatted(.currency(code: "INR"))), isDownButton: false, font: collapseFont))
    }
    
    private func setupCollapseUIForSecondVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: Constants.ExpandAndCollapse.SecondView.headerInfo, isDownButton: false, font: collapseFont))
    }
    
    private func setupCollapseUIForThirdVC() {
        cellTypes.removeAll()
        cellTypes.append(.header(info: Constants.ExpandAndCollapse.ThirdView.headerInfo, isDownButton: false, font: collapseFont))
    }
}
