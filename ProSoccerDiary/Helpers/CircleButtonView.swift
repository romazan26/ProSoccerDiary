//
//  CirculeButtonView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct CircleButtonView: View {
    var image = "plus.circle.fill"
    var body: some View {
        ZStack {
            Circle().foregroundStyle(.white)
                .frame(width: 66, height: 66)
            Image(systemName: image)
                .resizable()
                .frame(width: 67, height: 67)
            .foregroundStyle(.blueApp)
        }
    }
}

#Preview {
    CircleButtonView()
}
