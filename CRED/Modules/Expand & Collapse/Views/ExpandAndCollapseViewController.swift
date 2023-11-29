//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ExpandAndCollapseViewController: BaseViewController {
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = UIColor.eerieBlack
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var suggestionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "questionmark"), for: .normal)
        button.backgroundColor = UIColor.eerieBlack
        button.tintColor = .white
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()
    
    lazy var buttonContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dismissButton, suggestionButton])
        stackView.distribution = .equalCentering
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    lazy var ctaButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .policeBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Color.viewControllerBG
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var defaultHeight: CGFloat = UIScreen.main.bounds.size.height
    let maxDimmedAlpha: CGFloat = 0.6
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        registerTableView()
        setButtonTarget()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
    
    @objc func dismissButtonAction() {
        self.dismiss(animated: true)
    }
    
    @objc func suggestionButtonAction() {
        let alert = UIAlertController(title: "B I N G O !!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "DONE", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    @objc func ctaButtonAction() {
        let vc = ExpandableTwoViewController()
        vc.defaultHeight = 600
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
}


private extension ExpandAndCollapseViewController {
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
        view.addSubview(containerView)
        containerView.addSubview(buttonContainerStackView)
        containerView.addSubview(tableView)
        containerView.addSubview(ctaButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            buttonContainerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            buttonContainerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            buttonContainerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            buttonContainerStackView.heightAnchor.constraint(equalToConstant: 40),
            
            dismissButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor, multiplier: 1/1),
            suggestionButton.widthAnchor.constraint(equalTo: dismissButton.heightAnchor, multiplier: 1/1),
            
            ctaButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            ctaButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            ctaButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            ctaButton.heightAnchor.constraint(equalToConstant: 80),
            
            tableView.topAnchor.constraint(equalTo: buttonContainerStackView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: ctaButton.topAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])
    }
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        ExpandAndCollapseModel.TableView.allCases.forEach { cell in
            tableView.register(UINib(nibName: cell.rawValue, bundle: nil), forCellReuseIdentifier: cell.rawValue)
        }
    }
}
