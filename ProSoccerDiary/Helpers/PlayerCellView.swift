//
//  PlayerCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct PlayerCellView: View {
    let width: CGFloat = 262
    let height: CGFloat = 331
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            Image(.testPlayer)
                .resizable()
            ZStack {
                Color.blueApp
                    .frame(width: width, height: height / 3.5)
                    .opacity(0.5)
                    .shadow(color: .blue, radius: 20)
                    .blur(radius: 6.0)
                Text("Cristiano")
                    .padding()
                    .foregroundStyle(.white)
                .font(.title2)
            }
        }.frame(width: width, height: height)
    }
}

#Preview {
    PlayerCellView()
}
