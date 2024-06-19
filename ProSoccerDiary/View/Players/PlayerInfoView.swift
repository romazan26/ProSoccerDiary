//
//  PlayerInfoView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct PlayerInfoView: View {
    
    let player: Players
    @StateObject var vm = PlayerViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
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
                    
                    //MARK: - Name player
                    Text(player.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - age players
                    ZStack{
                        RoundedRectangle(cornerRadius: 29)
                            .foregroundStyle(.grayApp)
                        Text("\(player.age ?? "") years")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .heavy))
                    }.frame(width: 78, height: 30)
                }
                PlayerCellView(player: player, width: 262, height: 331)
                    .padding(.top, 20)
                
                //MARK: - Team player
                ZStack(alignment: .leading) {
                    Color.grayApp
                    Text(player.team ?? "no team")
                            .padding()
                            .foregroundStyle(.white)
                }
                .cornerRadius(12)
                .frame(maxWidth: .infinity)
                .frame(height: 69)
                .padding(.top, 10)
                
                Spacer()
                
                //MARK: - Delete button
                Button(action: {
                    vm.deletePlayer(player: player)
                    dismiss()
                }, label: {
                    Image(systemName: "trash.fill")
                        .resizable()
                        .frame(width: 24, height: 28)
                        .foregroundStyle(.white)
                })
            }.padding()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    PlayerInfoView()
//}
