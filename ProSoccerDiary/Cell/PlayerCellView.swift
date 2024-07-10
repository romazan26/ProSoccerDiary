//
//  PlayerCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct PlayerCellView: View {
    
    let player: Players
    var width: CGFloat = 170
    var height: CGFloat = 215
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            Image(uiImage: player.image ?? .noPhoto)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .cornerRadius(18)
            ZStack {
                Color.blueApp
                    .frame(width: width, height: height / 3.5)
                    .opacity(0.5)
                    .shadow(color: .blue, radius: 20)
                    .blur(radius: 6.0)
                Text(player.name ?? "")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .bold))
            }
        }
        .cornerRadius(18)
        .frame(width: width, height: height)
    }
}

//#Preview {
//    PlayerCellView(player: Players())
//}
