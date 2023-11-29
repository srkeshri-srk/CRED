//
//  FinalViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 29/11/23.
//

import UIKit

class FinalViewController: BaseViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = Constants.Final.message
        label.font = UIFont.systemFont(ofSize: 34.0)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Final.buttonTitle, for: .normal)
        button.setTitleColor(.vampireBlack, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstaints()
        button.addTarget(self, action: #selector(self.handleButtonTapAction), for: .touchUpInside)
    }
    
    private func setupConstaints() {
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func handleButtonTapAction() {
        self.dismiss(animated: true)
    }


}
