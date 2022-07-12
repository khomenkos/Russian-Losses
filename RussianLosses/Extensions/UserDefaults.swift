//
//  UserDefaults.swift
//  RussianLosses
//
//  Created by  Sasha Khomenko on 11.07.2022.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarding
    }
    
    var hasOnboarding: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarding.rawValue)
        }
        set {
            set(newValue, forKey: UserDefaultsKeys.hasOnboarding.rawValue)
        }
    }
}
