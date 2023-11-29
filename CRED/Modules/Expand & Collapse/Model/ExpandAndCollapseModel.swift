//
//  ExpandAndCollapseModel.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import Foundation

struct ExpandAndCollapseModel {
    enum TableView: String, CaseIterable {
        case creditAmountCell = "CreditAmountTableViewCell"
        case plansCell = "PlansTableViewCell"
        case buttonClipCell = "ButtonClipTableViewCell"
        case bankInfoCell = "BankInfoTableViewCell"
        case headerCell = "HeaderTableViewCell"
    }
    
    struct CollectionView {
        static let planCell = "PlanCollectionViewCell"
    }
}
