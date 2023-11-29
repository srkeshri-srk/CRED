//
//  PlansTableViewCell.swift
//  CRED
//
//  Created by Shreyansh Raj  Keshri on 28/11/23.
//

import UIKit

protocol PlansProtocol: AnyObject {
    func finalCalulation(value: Float)
}

class PlansTableViewCell: UITableViewCell, PlanCalulationable {

    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegation: PlansProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        registerCollectionView()
    }
    
    private func setupUI() {
        
    }
    
    private func registerCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ExpandAndCollapseModel.CollectionView.planCell, bundle: nil), forCellWithReuseIdentifier: ExpandAndCollapseModel.CollectionView.planCell)
    }
    
    func seeCalulation(value: Float) {
        delegation?.finalCalulation(value: value)
    }
    
}

extension PlansTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlanCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpandAndCollapseModel.CollectionView.planCell, for: indexPath) as! PlanCollectionViewCell
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 0)
    }
    
}
