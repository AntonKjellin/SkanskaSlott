//
//  SaveButtonView.swift
//  SkanskaSlott
//
//  Created by Anton Kjellin on 2022-12-05.
//

import SwiftUI

struct SaveButtonView: View {
    
    @State var place : Place
    @State var save: (Place) -> Void
    @State var contains: (Place) -> Bool
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: contains(place) ? "bookmark.fill" : "bookmark")
        })
    }
}

