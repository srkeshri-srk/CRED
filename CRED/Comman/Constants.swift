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
        
        struct TableView {
            static let creditAmountCell = "CreditAmountTableViewCell"
            static let plansCell = "PlansTableViewCell"
            static let buttonClipCell = "ButtonClipTableViewCell"
            static let bankInfoCell = "BankInfoTableViewCell"
            static let headerCell = "HeaderTableViewCell"
        }
        
        struct CollectionView {
            static let planCell = "PlanCollectionViewCell"
        }
    }

}
