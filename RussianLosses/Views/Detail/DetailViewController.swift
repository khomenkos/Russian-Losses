//
//  DetailViewController.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 12.07.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var equipmentCollectionView: UICollectionView!
    @IBOutlet weak var countLosses: UILabel!

    var personnel: Personnel?
    var equipment: Equipment?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        equipmentCollectionView.dataSource = self
        equipmentCollectionView.delegate = self
        
        registerCells()

        setup()
    }
    
    func setup() {
        dayLabel.text = personnel?.stringDays
        countLosses.text = personnel?.stringAmount
    }
    
    @IBAction func supportBtn(_ sender: Any) {
        if let url = URL(string: "https://bank.gov.ua/ua/about/support-the-armed-forces") {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func registerCells() {
        equipmentCollectionView.register(UINib(nibName: EquipmentCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: EquipmentCollectionViewCell.identifier)

    }
}
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        switch collectionView {
        case equipmentCollectionView:
            return 10
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case equipmentCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EquipmentCollectionViewCell.identifier, for: indexPath) as! EquipmentCollectionViewCell
            cell.setup(equipment: equipment!)
            return cell
        default: return UICollectionViewCell()
        }
    }
}
