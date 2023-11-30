//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ExpandAndCollapseViewController: UIViewController {
    
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
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    lazy var ctaButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .policeBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.tag = 3
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
    var maxDimmedAlpha: CGFloat = 0.6
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
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
        let alert = UIAlertController(title: Constants.AlertMessage.Suggetion.title, message: Constants.AlertMessage.Suggetion.message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.AlertMessage.Suggetion.buttonTitle, style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    @objc func ctaButtonAction(sender: UIButton) {
        if sender.tag > 1 {
            UIView.animate(withDuration: 0.1) {
                self.viewModel.setupCollapseUI()
                self.tableView.reloadData()
            }
            
            //Recursion Here
            let expandAndCollapseVC = ExpandAndCollapseViewController()
            expandAndCollapseVC.defaultHeight = defaultHeight - 100
            expandAndCollapseVC.modalPresentationStyle = .overCurrentContext
            expandAndCollapseVC.buttonContainerStackView.isHidden = true
            expandAndCollapseVC.maxDimmedAlpha = maxDimmedAlpha - 0.1
            expandAndCollapseVC.ctaButton.tag = ctaButton.tag - 1
            self.present(expandAndCollapseVC, animated: false)
        } else {
            let finalVC = FinalViewController()
            finalVC.modalPresentationStyle = .overFullScreen
            self.present(finalVC, animated: true)
        }
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
}

extension ExpandAndCollapseViewController: CreditAmountable {
    func sliderValueChanged(value: CGFloat) {
        viewModel.creditAmount = value
    }
}

extension ExpandAndCollapseViewController: ButtonClipable {
    func buttonTapAction() {
        let alert = UIAlertController(title: Constants.AlertMessage.ClipButton.title, message: Constants.AlertMessage.ClipButton.message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.AlertMessage.ClipButton.buttonTitle, style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension ExpandAndCollapseViewController: PlansProtocol {
    func finalCalulation(value: Float) {
        let alert = UIAlertController(title: Constants.AlertMessage.Plan.title, message: Constants.AlertMessage.Plan.message, preferredStyle: .alert)
        let action = UIAlertAction(title:Constants.AlertMessage.Plan.buttonTitle, style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
