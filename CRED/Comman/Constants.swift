//
//  Constants.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 27/11/23.
//

import UIKit


struct Constants {
    //MARK: - Color
    struct Color {
        static let viewControllerBG: UIColor = .vampireBlack
        static let containerView: UIColor = .lightBlack
    }
    
    //MARK: - Home
    struct Home {
        static let title = "CRED"
    }
    
    //MARK: - Expand & Collapse
    struct ExpandAndCollapse {
        struct FirstView {
            static let headerInfo = HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")
            static let ctaButtonTitle = "Proceed to EMI selection"
        }
        
        struct SecondView {
            static let headerInfo = HeaderInfo(titleText: "how do you wish to repay?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")
            static let buttonClip = "create your own plan"
            static let ctaButtonTitle = "Select your bank account"
        }
        
        struct ThirdView {
            static let headerInfo = HeaderInfo(titleText: "where should we send the money?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue.")
            static let buttonClip = "change account"
            static let ctaButtonTitle = "Tap for 1-click KYC"
        }
    }
    
    //MARK: - Final
    struct Final {
        static let message = """
                    F  I  N  A  L
                    D E S T I N A T I O N
                    """
        static let buttonTitle = "back to pavilion"
    }
    
    //MARK: - Alert Message
    struct AlertMessage {
        struct Suggetion {
            static let title = "Lunch Break"
            static let message = "Sunday ko aa..hen.. \n Sunday ko mast naha dho ke aa!"
            static let buttonTitle = "Okey?"
        }
        
        struct ClipButton {
            static let title = "Yaah Yaah I'm Alive 🥱"
            static let message = "Don't disturb me let me sleep 😴💤"
            static let buttonTitle = "Good Night"
        }
        
        struct Plan {
            static let title = "Laa baba, 5 crore"
            static let message = ""
            static let buttonTitle = "Nahi Dunga 😏"
        }
    }

}
