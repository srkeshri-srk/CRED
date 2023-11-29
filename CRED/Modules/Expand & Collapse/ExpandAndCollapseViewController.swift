//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ExpandAndCollapseViewController: BaseViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var suggestionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerTableView()

    }
    
    private func setupUI() {
        dismissButton.layer.cornerRadius = dismissButton.bounds.size.height / 2
        suggestionButton.layer.cornerRadius = suggestionButton.bounds.size.height / 2
        
        ctaButton.backgroundColor = .policeBlue
        ctaButton.titleLabel?.textColor = .white
        ctaButton.setTitle("Process to EMI selection", for: .normal)
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.headerCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.headerCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.creditAmountCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.creditAmountCell)
    }
    
    @IBAction func dismissButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func suggestionButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "B I N G O !!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "DONE", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
    @IBAction func ctaButtonAction(_ sender: UIButton) {
        let vc = ExpandableTwoViewController()
        vc.defaultHeight = 600
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
}

extension ExpandAndCollapseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.headerCell, for: indexPath) as! HeaderTableViewCell
            cell.configureUI(info: HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue."))
            return cell
        } else {
            let cell: CreditAmountTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.creditAmountCell, for: indexPath) as! CreditAmountTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100.0
        } else {
            return UITableView.automaticDimension
        }
    }
}
