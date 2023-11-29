//
//  ExpandAndCollapse+Constraints.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import UIKit


//MARK: - UI & Constraints
extension ExpandAndCollapseViewController {
    func setupUI() {
        dismissButton.layer.cornerRadius = dismissButton.bounds.size.height / 2
        suggestionButton.layer.cornerRadius = suggestionButton.bounds.size.height / 2
        
        ctaButton.setTitle("Process to EMI selection", for: .normal)
    }
    
    func setButtonTarget() {
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        suggestionButton.addTarget(self, action: #selector(suggestionButtonAction), for: .touchUpInside)
        ctaButton.addTarget(self, action: #selector(ctaButtonAction), for: .touchUpInside)
    }
    
    func setupConstraints() {
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.addSubview(buttonContainerStackView)
        containerView.addSubview(contentStackView)
        
        
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            buttonContainerStackView.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 25),
            buttonContainerStackView.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor, constant: -25),
            buttonContainerStackView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -15),
            buttonContainerStackView.heightAnchor.constraint(equalToConstant: 40),

            dismissButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor, multiplier: 1/1),
            suggestionButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor, multiplier: 1/1),
            
            ctaButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        ExpandAndCollapseModel.TableView.allCases.forEach { cell in
            tableView.register(UINib(nibName: cell.rawValue, bundle: nil), forCellReuseIdentifier: cell.rawValue)
        }
    }
}
