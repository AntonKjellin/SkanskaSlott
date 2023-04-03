//
//  OverView.swift
//  HemsoktaPlatserV2
//
//  Created by Anton Kjellin on 2022-11-20.
//

import SwiftUI

struct PlaceView: View {
    @ObservedObject var vm : ViewModel
    @State var isFiltered = false
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                NavigationLink(destination: {
                    VStack{
                        Text("Vill ni ha era bilder borttagna hör av er till antonkjellins@gmail.com")
                        /*  List{
                         ForEach(vm.places){ place in
                         Text(place.title)
                         Text(place.copyright)
                         }
                         } */
                    }
                }, label: {Image(systemName: "info.circle")
                        .foregroundColor(Color.purple)
                })
                .padding(.leading)
                
                Spacer()
                Button{
                    if isFiltered{
                        isFiltered = false
                    }else{
                        isFiltered = true
                    }
                } label: {
                    HStack{
                        Text("Visa Sparade")
                        Image(systemName: isFiltered ? "bookmark.fill" : "bookmark")
                    }.foregroundColor(Color.purple)
                } .padding()
                
            }
            List{
                ForEach(isFiltered ? vm.filteredPlaces : vm.places){ place in
                    NavigationLink(destination: PlaceDetailView(vm: vm, currentPlace: place)){
                        VStack{
                            Image(place.title)
                                .resizable()
                                .frame(width: 300, height: 200)
                                .background(.gray)
                            HStack{
                                VStack(alignment: .leading){
                                    Text(place.title)
                                        .font(.headline)
                                    Text(place.description)
                                        .font(.headline)
                                }
                                Spacer()
                                Image(systemName: vm.contains(place) ? "bookmark.fill" : "bookmark")
                                    .foregroundColor(.accentColor)
                                    .onTapGesture {
                                        vm.toggleSave(place: place)
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(vm: ViewModel())
    }
}
