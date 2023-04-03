//
//  Place.swift
//  SkanskaSlott
//
//  Created by Anton Kjellin on 2022-12-05.
//

import Foundation
import MapKit

struct Place: Identifiable, Codable {
    let id: Int
    let title: String
    let copyright: String
    let description: String
    let mainText: String
    let located: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
