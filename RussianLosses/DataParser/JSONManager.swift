//
//  JSONManager.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 15.07.2022.
//

import Foundation

class JsonManager {
    
    static let shared = JsonManager()
    
    func fetchEquipment(success: @escaping ([Equipment]) -> (), failure: @escaping (String) -> ()) {
        if let localData = self.readLocalFile(forName: "russia_losses_equipment") {
            let demoData = self.getEquipment(jsonData: localData)
            demoData != nil ? success(demoData!) : failure("Oops! Something went wrong.")
        }
    }

    func fetchPersonnel(success: @escaping ([Personnel]) -> (), failure: @escaping (String) -> ()) {
        if let localData = self.readLocalFile(forName: "russia_losses_personnel") {
            let demoData = self.getPersonnel(jsonData: localData)
            demoData != nil ? success(demoData!) : failure("Oops! Something went wrong.")
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                return jsonData
            }
        } catch {
            print("JSON Read Error:\(error.localizedDescription)")
        }
        return nil
    }

    // Decode Equipment
    private func getEquipment(jsonData: Data) -> [Equipment]? {
        do {
            let decodedData = try JSONDecoder().decode([Equipment].self,
                                                       from: jsonData)
            return decodedData
        } catch {
            print("JSON Parse error: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Decode Personnel
    private func getPersonnel(jsonData: Data) -> [Personnel]? {
        do {
            let decodedData = try JSONDecoder().decode([Personnel].self,
                                                       from: jsonData)
            return decodedData
        } catch {
            print("JSON Parse error: \(error.localizedDescription)")
            return nil
        }
    }
}
