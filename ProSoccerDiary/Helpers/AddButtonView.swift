//
//  AddButtonView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 48)
                .foregroundStyle(.blueApp)
            Text("Add new")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
        }.frame(width: .infinity, height: 67)
    }
}

#Preview {
    AddButtonView()
}
