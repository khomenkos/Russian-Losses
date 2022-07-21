//
//  MainViewController.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 20.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var personnel: [Personnel] = []
    var equipment: [Equipment] = []
    var modelCell: [ModelCellEquipment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Втрати противника"
        registerCells()
        
        JsonManager.shared.fetchPersonnel { [weak self] (data) in
            self?.personnel = data
            self?.tableView.reloadData()
        } failure: { string in
            print(string)
        }
        
        JsonManager.shared.fetchEquipment { [weak self] (data) in
            self?.equipment = data
        } failure: { string in
            print(string)
        }
    }
        
    private func registerCells() {
        tableView.register(UINib(nibName: DateTableViewCell.identifier , bundle: nil), forCellReuseIdentifier: DateTableViewCell.identifier)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personnel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier) as! DateTableViewCell
        cell.setup(personnel: personnel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController.instantiate()
        controller.personnel = personnel[indexPath.row]
        controller.equipment = equipment[indexPath.row]
        navigationController?.present(controller, animated: true, completion: nil)
        //navigationController?.pushViewController(controller, animated: true)
    }
}
