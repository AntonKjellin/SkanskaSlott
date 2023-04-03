//
//  MainView.swift
//  HemsoktaPlatserV2
//
//  Created by Anton Kjellin on 2022-11-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @State var showingSaved: Bool = false

    var body: some View {
        NavigationStack{
            ZStack{
                MapView(vm: vm)
                HStack{
                    Spacer()
                    VStack{
                        NavigationLink(destination: PlaceView(vm: vm)){
                            VStack{
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 44, height: 44)
                            }
                            .foregroundColor(Color.purple)
                        }
                        .padding()
                        Spacer()
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
