//
//  SettingsStore.swift
//  SwiftUIDataSharing
//
//  Created by Maxim Brishten on 16.05.23.
//

import Foundation
import Combine

final class SettingStore: ObservableObject {
    init() {
        UserDefaults.standard.register(defaults: [
            "view.preferences.showCheckInOnly" : false,
            "view.preferences.displayOrder" : 0,
            "view.preferences.maxPriceLevel" : 5
        ])
    }

    @Published var showCheckInOnly: Bool = UserDefaults.standard.bool(forKey: "view.preferences.showCheckInOnly") {
        didSet {
            UserDefaults.standard.set(showCheckInOnly, forKey: "view.preferences.showCheckInOnly")
        }
    }

    @Published var displayOrder: OrderType = OrderType(type: UserDefaults.standard.integer(forKey: "view.preferences.displayOrder")) {
        didSet {
            UserDefaults.standard.set(displayOrder.rawValue, forKey: "view.preferences.displayOrder")
        }
    }

    @Published var maxPriceLevel: Int = UserDefaults.standard.integer(forKey: "view.preferences.maxPriceLevel") {
        didSet {
            UserDefaults.standard.set(maxPriceLevel, forKey: "view.preferences.maxPriceLevel")
        }
    }
}
