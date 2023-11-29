//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ExpandAndCollapseViewController: BaseViewController {
    
    //MARK: - UI Components
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
    
    lazy var contentStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [tableView, ctaButton])
        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Color.containerView
        view.layer.cornerRadius = 16
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
    
    //MARK: - Variables
    var defaultHeight: CGFloat = UIScreen.main.bounds.size.height - 150
    let maxDimmedAlpha: CGFloat = 0.6
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    var viewModel: ExpandAndCollapseProtocol = ExpandAndCollapseViewModel()
    
    
    
    //MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        registerTableView()
        setButtonTarget()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
    
    
    //MARK: - Actions
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
//        let vc = ExpandableTwoViewController()
//        vc.defaultHeight = 600
//        vc.modalPresentationStyle = .overCurrentContext
//        self.present(vc, animated: false)
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
}
