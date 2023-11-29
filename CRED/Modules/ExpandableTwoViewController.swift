//
//  ExpandableTwoViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 29/11/23.
//

import UIKit

class ExpandableTwoViewController: BaseViewController {
    // define lazy views
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = view.tintColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    lazy var contentStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [tableView, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 12.0
        return stackView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Color.viewControllerBG
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    var defaultHeight: CGFloat = 0
    let maxDimmedAlpha: CGFloat = 0.6
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        registerTableView()
        
        // tap gesture on dimmed view to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
        
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.headerCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.headerCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.plansCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.plansCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.buttonClipCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.buttonClipCell)
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        // Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // content stackView
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            registerButton.heightAnchor.constraint(equalToConstant: 80),
            tableView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
        
    // MARK: Present and dismiss animation
    func animatePresentContainer() {
        // update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // call this to trigger refresh constraint
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
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
        // hide main view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    //Actions
    @objc func presentModalController() {
        let vc = ExpandableThreeViewController()
        vc.defaultHeight = 480
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }


}

extension ExpandableTwoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.headerCell, for: indexPath) as! HeaderTableViewCell
            cell.configureUI(info: HeaderInfo(titleText: "how do you wish to repay?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue."))
            return cell
        } else if indexPath.row == 1 {
            let cell: PlansTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.plansCell, for: indexPath) as! PlansTableViewCell
            return cell
        } else {
            let cell: ButtonClipTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.buttonClipCell, for: indexPath) as! ButtonClipTableViewCell
            cell.configureUI(title: "create your own plan")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100.0
        } else if indexPath.row == 1 {
            return 250.0
        } else {
            return UITableView.automaticDimension
        }
    }
}
