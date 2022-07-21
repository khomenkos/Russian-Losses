//
//  Equipment.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 12.07.2022.
//

import Foundation
import UIKit

struct Equipment: Decodable {
    
    let date: String?
    let day: Int?
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let apc: Int?
    let field_artillery: Int?
    let mrl: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    let greatestLossesDirection: String?

    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case apc = "APC"
        case field_artillery = "field artillery"
        case mrl = "MRL"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }
}

struct ModelCellEquipment {
    let title: String
    let amount: Int?
    let image: String
}

