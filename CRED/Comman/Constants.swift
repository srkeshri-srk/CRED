//
//  Constants.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 27/11/23.
//

import UIKit


struct Constants {
    struct Color {
        static let viewControllerBG: UIColor = .vampireBlack
    }
    
    struct Home {
        static let title = "CRED"
    }
    
    struct ExpandAndCollapse {
        static let storyBoard = "ExpandAndCollapse"
        static let identifierID = "ExpandAndCollapseViewController"
        
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

}
