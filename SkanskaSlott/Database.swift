//
//  Database.swift
//  HemsoktaPlatserV2
//
//  Created by Anton Kjellin on 2022-11-17.
//

import Foundation

final class Database {
    private let SAV_KEY = "sav_key"
    
    func save(places: Set<Int>) {
        let array = Array(places)
        UserDefaults.standard.set(array, forKey: SAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: SAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
    
}
