//
//  Personnel.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 12.07.2022.
//

import Foundation

struct Personnel: Decodable {
    let date: String?
    let day: Int?
    let personnel: Int?
    let pow: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case pow = "POW"
    }
    
    var personnelToString: String {
        return String(personnel ?? 0)
    }
    var dayToString: String {
        return String(day ?? 0)
    }
    var daysToString: String {
        return "\(day ?? 0)-й день боротьби з окупантами"
    }
}
