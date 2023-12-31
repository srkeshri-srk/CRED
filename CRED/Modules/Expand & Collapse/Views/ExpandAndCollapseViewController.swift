//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit


protocol ExpandAndCollapseViewControllerDelegate: AnyObject {
    func willDismiss()
    func didDismiss()
}


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
        button.titleLabel?.isUserInteractionEnabled = false
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
    var maxDimmedAlpha: CGFloat = 0.6
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    var viewModel: ExpandAndCollapseProtocol = ExpandAndCollapseViewModel()
    weak var delegate: ExpandAndCollapseViewControllerDelegate?
    
    
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
                        
        if viewModel.currentUIViewNumber == 3 {
            viewModel.currentUIViewStates.append(.creditAmountExpand)
        } else if viewModel.currentUIViewNumber == 2 {
            viewModel.currentUIViewStates.append(.plansExpand)
        } else {
            viewModel.currentUIViewStates.append(.bankInfoExpand)
        }
        
        viewModel.currentUIViewNumber -= 1
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUI()
    }
    
    
    //MARK: - Actions
    @objc func dismissButtonAction(animated: Bool = true) {
        self.dismiss(animated: animated) { [weak self] in
            self?.delegate?.didDismiss()
        }
    }
    
    @objc func suggestionButtonAction() {
        let alert = UIAlertController(title: Constants.AlertMessage.Suggetion.title, message: Constants.AlertMessage.Suggetion.message, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.AlertMessage.Suggetion.buttonTitle, style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @objc func ctaButtonAction(sender: UIButton) {
        if viewModel.currentUIViewNumber == 2 {
            viewModel.currentUIViewStates.removeAll{ $0 == .creditAmountExpand }
            viewModel.currentUIViewStates.append(.creditAmountCollapse)
        } else if viewModel.currentUIViewNumber == 1 {
            viewModel.currentUIViewStates.removeAll{ $0 == .plansExpand }
            viewModel.currentUIViewStates.append(.plansCollapse)
        }
        
        reloadData()
        
        if viewModel.currentUIViewNumber > 0 {
            //Recursion Here
            let expandAndCollapseVC = ExpandAndCollapseViewController()
            expandAndCollapseVC.viewModel = viewModel
            expandAndCollapseVC.defaultHeight = defaultHeight - 100
            expandAndCollapseVC.modalPresentationStyle = .overCurrentContext
            expandAndCollapseVC.buttonContainerStackView.isHidden = true
            expandAndCollapseVC.maxDimmedAlpha = maxDimmedAlpha - 0.1
            expandAndCollapseVC.delegate = self
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
    
    func reloadData(subtype: CATransitionSubtype = .fromTop) {
        let transition = CATransition()
        transition.type = .push
        transition.subtype = subtype
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.fillMode = .forwards
        tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
        tableView.reloadData()
    }
}

extension ExpandAndCollapseViewController: ExpandAndCollapseViewControllerDelegate {
    func willDismiss() {
        if viewModel.currentUIViewNumber == 2 {
            viewModel.currentUIViewStates.removeAll{ $0 == .creditAmountCollapse }
            viewModel.currentUIViewStates.append(.creditAmountExpand)
        } else if viewModel.currentUIViewNumber == 1 {
            viewModel.currentUIViewStates.removeAll{ $0 == .plansCollapse }
            viewModel.currentUIViewStates.append(.plansExpand)
        } else {
            viewModel.currentUIViewStates.removeAll{ $0 == .bankInfoCollapse }
            viewModel.currentUIViewStates.append(.bankInfoExpand)
        }
        reloadData(subtype: .fromBottom)
    }
    
    func didDismiss() {
        
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
