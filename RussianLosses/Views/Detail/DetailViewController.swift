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
    
    var equipment: [Equipment] = []
    var personnel: [Personnel] = []
    var modelCell: [ModelCell] = [
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Танк", count: "10000", image: #imageLiteral(resourceName: "tank")),
        .init(title: "Tank", count: "10020", image: #imageLiteral(resourceName: "image_2.svg"))
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        equipmentCollectionView.dataSource = self
        equipmentCollectionView.delegate = self
        
        registerCells()
        
        
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
        
        return 10
        
//        switch collectionView {
//        case equipmentCollectionView:
//            return equipment.count
//        default: return 0
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case equipmentCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EquipmentCollectionViewCell.identifier, for: indexPath) as! EquipmentCollectionViewCell
            cell.setup(equipment: modelCell[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
    }
}
