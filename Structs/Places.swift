//
//  Places.swift
//  SkanskaSlott
//
//  Created by Anton Kjellin on 2022-12-05.
//

import Foundation

var Places: [Place] = load("Places.json")

func load<T:Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldnt find")
    }
    
    do{
       data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldnt load")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldnt parse")
    }
}
