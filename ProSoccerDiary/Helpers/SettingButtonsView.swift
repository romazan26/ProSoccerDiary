//
//  SettingButtonsView.swift
//  ProSoccerDiary
//
//  Created by Роман on 25.06.2024.
//

import SwiftUI


struct SettingButton: View {
    var text = ""
    var imageName = ""
    var body: some View {
        ZStack {
            Color(.grayApp)
                .cornerRadius(19)
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text(text)
                Spacer()
            }
            .padding(.horizontal, 35)
            .foregroundStyle(.white)
            .font(.system(size: 15, weight: .heavy))
        }
        .frame(width: 336, height: 76)
    }
}



#Preview {
    SettingButton()
}
