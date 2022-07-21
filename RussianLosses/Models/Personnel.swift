//
//  Personnel.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 12.07.2022.
//

import Foundation

struct Personnel: Codable {
    let date: String
    let day: Int
    let personnel: Int
    let pow: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case pow = "POW"
    }
    
    
    //EDIT 
    var stringAmount: String {
        return String(personnel)
    }
    
    var stringDay: String {
        return String(day)
    }
    var stringDays: String {
        return "\(day)-й день боротьби з окупантами"
    }
}

struct ModelCellPersonnel {
    let day: Int
    let personnelCount: Int
}
