//
//  Content-ViewModel.swift
//  HemsoktaPlatserV2
//
//  Created by Anton Kjellin on 2022-11-17.
//

import Foundation
import MapKit

    @MainActor class ViewModel: ObservableObject{   
        @Published var places = [Place]()
        @Published var showingSaved = false
        @Published var savedPlaces = Set<Int>()

        
        
        var filteredPlaces: [Place]{
            return places.filter{savedPlaces.contains($0.id)}
        }
        
        
        private var db = Database()
        
        init() {
            self.savedPlaces = db.load()
            self.places = Places
        }
        
        func contains(_ place: Place) -> Bool{
            savedPlaces.contains(place.id)
        }
        
        
        func toggleSave(place: Place){
            if contains(place){
                savedPlaces.remove(place.id)
            } else {
                savedPlaces.insert(place.id)
            }
            db.save(places: savedPlaces)
        }
}


