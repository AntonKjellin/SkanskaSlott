//
//  PlaceDetailView.swift
//  HemsoktaPlatserV2
//
//  Created by Anton Kjellin on 2022-11-17.
//

import SwiftUI

struct PlaceDetailView: View {
    
    @ObservedObject var vm : ViewModel
    let currentPlace: Place
    
    
    var body: some View {
        VStack{
                    Image(currentPlace.title)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                    HStack{
                        Text(currentPlace.title)
                            .font(.title)
                            .bold()
                            .padding(.leading)
                        Spacer()
                        Image(systemName: vm.contains(currentPlace) ? "bookmark.fill" : "bookmark")
                            .foregroundColor(.accentColor)
                            .onTapGesture {
                                withAnimation{
                                        vm.toggleSave(place: currentPlace)
                                }
                            }
                        .padding(.trailing)
                    }
            ScrollView{
                Text(currentPlace.mainText)
                    .padding()
            }
            Spacer()
        }   
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailView(vm: ViewModel(), currentPlace: Place(id: 2, title: "Svaneholms Slott", copyright: "2", description: "This is it boys", mainText: "Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum", located: "Skurup",latitude: 2, longitude: 2))
    }
}
