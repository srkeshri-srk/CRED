//
//  ExpandAndCollapseViewController.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

class ExpandAndCollapseViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        registerTableView()

    }
    
    private func setupUI() {
        
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.ExpandAndCollapse.CreditAmountTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.ExpandAndCollapse.CreditAmountTableViewCell)
    }

    

}

extension ExpandAndCollapseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CreditAmountTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.CreditAmountTableViewCell, for: indexPath) as! CreditAmountTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
