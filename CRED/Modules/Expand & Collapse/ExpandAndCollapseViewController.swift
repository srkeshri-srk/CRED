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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerTableView()

    }
    
    private func setupUI() {
        dismissButton.layer.cornerRadius = dismissButton.bounds.size.height / 2
        suggestionButton.layer.cornerRadius = suggestionButton.bounds.size.height / 2
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.creditAmountCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.creditAmountCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.plansCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.plansCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.buttonClipCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.buttonClipCell)
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.TableView.bankInfoCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.TableView.bankInfoCell)
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

}

extension ExpandAndCollapseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: CreditAmountTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.creditAmountCell, for: indexPath) as! CreditAmountTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell: PlansTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.plansCell, for: indexPath) as! PlansTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell: ButtonClipTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.buttonClipCell, for: indexPath) as! ButtonClipTableViewCell
            return cell
        } else {
            let cell: BankInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.bankInfoCell, for: indexPath) as! BankInfoTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else if indexPath.row == 1 {
            return 220.0
        } else {
            return UITableView.automaticDimension
        }
    }
}
