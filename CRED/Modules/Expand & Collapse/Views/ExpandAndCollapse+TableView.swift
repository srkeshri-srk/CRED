//
//  ExpandAndCollapse+TableView.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import UIKit


extension ExpandAndCollapseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.ExpandAndCollapse.TableView.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.headerCell.rawValue, for: indexPath) as! HeaderTableViewCell
            cell.configureUI(info: HeaderInfo(titleText: "Shreyansh, how much do you need?", subTitleText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis luctus augue."))
            return cell
        } else if indexPath.row == 1 {
            let cell: CreditAmountTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.creditAmountCell.rawValue, for: indexPath) as! CreditAmountTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell: ButtonClipTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.buttonClipCell.rawValue, for: indexPath) as! ButtonClipTableViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell: PlansTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.plansCell.rawValue, for: indexPath) as! PlansTableViewCell
            return cell
        } else {
            let cell: BankInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.ExpandAndCollapse.TableView.bankInfoCell.rawValue, for: indexPath) as! BankInfoTableViewCell
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
