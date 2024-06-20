//
//  TrainingCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct StageCellView: View {
    
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .foregroundStyle(.blueApp)
                        .frame(width: 13)
                    Text("Warm up 30 min")
                        .foregroundStyle(.white)
                    Spacer()
                }
            }.padding()
        }
        .frame(width: .infinity, height: 185)
        .cornerRadius(15)
    }
}

#Preview {
    StageCellView()
}
