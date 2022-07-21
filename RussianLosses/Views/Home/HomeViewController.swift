//
//  ViewController.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 11.07.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var pers: Personnel!
    var personnel: [Personnel] = []
    var equipment: [Equipment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        JsonManager.shared.fetchPersonnel { [weak self] (data) in
//            print(data)
//            print("===================================")
//            self?.personnel = data
//
//
//        } failure: { string in
//            print(string)
//        }
//
//        JsonManager().fetchEquipment { [weak self] (data) in
//            print(data)
//            print("===================================")
//            self?.equipment = data
//            /// Reload the view using the main dispatch queue
//            DispatchQueue.main.async {
//                /// Do something related to UIView
//            }
//        } failure: { string in
//            print(string)
//        }
//        print(getDate())
//
    }
    
    @IBAction func detailBtn(_ sender: Any) {

    }
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: datePicker.date)
        return date
    }
}
