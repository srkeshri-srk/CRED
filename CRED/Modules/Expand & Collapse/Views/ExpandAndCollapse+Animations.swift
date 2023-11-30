//
//  ExpandAndCollapse+Animations.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import UIKit


//MARK: - Animations
extension ExpandAndCollapseViewController {
    func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.viewModel.currentUIViewNumber += 1

//            if self.viewModel.currentUIViewNumber == 1 {
//                self.viewModel.currentUIViewStates.removeAll{ $0 == .creditAmountCollapse }
//            } else {
//                self.viewModel.currentUIViewStates.removeAll{ $0 == .plansCollapse }
//            }
            
            self.dismiss(animated: false)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            self.view.layoutIfNeeded()
        }
    }
}
