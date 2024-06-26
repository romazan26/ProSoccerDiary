//
//  FavoritePlayersView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct FavoritePlayersView: View {
    
    @StateObject var vm = PlayerViewModel()
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            //MARK: - background
            Color.mainApp
                .ignoresSafeArea()
            VStack {
                
                //MARK: - Toolbar
                HStack {
                    
                    //MARK: - Back buttom
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundStyle(.white)
                    }).frame(width: 24, height: 24)
                    
                    //MARK: - Title view
                    Text("Favorite players")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - count players
                    ZStack{
                        Circle().foregroundStyle(.grayApp)
                        Text("\(vm.players.count)")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .heavy))
                    }.frame(width: 30, height: 30)
                }.padding()
                
                Spacer()
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                    //MARK: - Players
                    ScrollView{
                        if !vm.players.isEmpty {
                            playerListView(items: vm.players)
                        }else {
                            Text("No favorite players").foregroundStyle(.white)
                        }
                    }
                    
                    //MARK: - Add button
                    HStack{
                        Spacer()
                        NavigationLink {
                            NewPlayerView(vm: vm)
                        } label: {
                            CircleButtonView(image: "plus.circle.fill")
                        }
                        
                    }.padding()
                }
            }
        }
        .onAppear(perform: {
            vm.getPlayers()
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FavoritePlayersView()
}
