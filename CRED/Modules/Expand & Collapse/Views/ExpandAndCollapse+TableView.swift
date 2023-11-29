//
//  ExpandAndCollapse+TableView.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 30/11/23.
//

import UIKit


//MARK: - TableView Extensions
extension ExpandAndCollapseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellTypes[indexPath.row]
        
        switch cellType {
        case .header(let info):
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandAndCollapseModel.TableView.headerCell.rawValue, for: indexPath) as! HeaderTableViewCell
            cell.configureUI(info: info)
            return cell
        case .creditAmount:
            let cell: CreditAmountTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandAndCollapseModel.TableView.creditAmountCell.rawValue, for: indexPath) as! CreditAmountTableViewCell
            return cell
        case .plans:
            let cell: PlansTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandAndCollapseModel.TableView.plansCell.rawValue, for: indexPath) as! PlansTableViewCell
            return cell
        case .buttonClip(let title):
            let cell: ButtonClipTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandAndCollapseModel.TableView.buttonClipCell.rawValue, for: indexPath) as! ButtonClipTableViewCell
            cell.configureUI(title: title)
            return cell
        case .bankInfo:
            let cell: BankInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandAndCollapseModel.TableView.bankInfoCell.rawValue, for: indexPath) as! BankInfoTableViewCell
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
