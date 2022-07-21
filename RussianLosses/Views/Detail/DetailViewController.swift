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
    @IBOutlet weak var greatestDirection: UILabel!
    
    var personnel: Personnel?
    var equipment: Equipment?
    var modelCell: ModelCellEquipment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        equipmentCollectionView.dataSource = self
        equipmentCollectionView.delegate = self
        
        registerCells()
        setup()
    }
    
    
    //Edit
    func configEquipmentCell(equipment: Equipment?) -> [ModelCellEquipment] {
        
        let (aircraft,
             helicopter,
             tank,
             apc,
             field_artillery,
             mrl,
             drone,
             navalShip,
             antiAircraftWarfare,
             specialEquipment,
             vehiclesAndFuelTanks,
             cruiseMissiles) = (equipment?.aircraft,
                                equipment?.helicopter,
                                equipment?.tank,
                                equipment?.apc,
                                equipment?.field_artillery,
                                equipment?.mrl,
                                equipment?.drone,
                                equipment?.navalShip,
                                equipment?.antiAircraftWarfare,
                                equipment?.specialEquipment,
                                equipment?.vehiclesAndFuelTanks,
                                equipment?.cruiseMissiles)
        
        let modelCell: [ModelCellEquipment] = [
            ModelCellEquipment(title: "Танки", amount: tank, image: "tank"),
            ModelCellEquipment(title: "Літаки", amount: aircraft, image: "aircraft"),
            ModelCellEquipment(title: "БТР", amount: apc, image: "apc"),
            ModelCellEquipment(title: "Польова артилерія", amount: field_artillery, image: "field_artillery"),
            ModelCellEquipment(title: "Гелікоптери", amount: helicopter, image: "helicopter"),
            ModelCellEquipment(title: "РСЗВ", amount: mrl, image: "mrl"),
            ModelCellEquipment(title: "Дрони", amount: drone, image: "drone"),
            ModelCellEquipment(title: "Військові кораблі", amount: navalShip, image: "navalShip"),
            ModelCellEquipment(title: "ППО", amount: antiAircraftWarfare, image: "antiAircraftWarfare"),
            ModelCellEquipment(title: "Спецобладнання", amount: specialEquipment, image: "specialEquipment"),
            ModelCellEquipment(title: "Автомобілі та паливні баки", amount: vehiclesAndFuelTanks, image: "vehiclesAndFuelTanks"),
            ModelCellEquipment(title: "Крилаті ракети", amount: cruiseMissiles, image: "cruiseMissiles")]
        return modelCell
    }
    
    func setup() {
        dayLabel.text = personnel?.daysToString
        countLosses.text = personnel?.personnelToString
        greatestDirection.text = "Напрямок найбільших втрат: \(equipment?.greatestLossesDirection ?? "Москва")"
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
        return configEquipmentCell(equipment: equipment).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EquipmentCollectionViewCell.identifier, for: indexPath) as! EquipmentCollectionViewCell
        cell.setup(equipment: configEquipmentCell(equipment: equipment)[indexPath.row])
        return cell
    }
}
