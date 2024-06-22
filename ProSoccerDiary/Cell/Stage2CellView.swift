//
//  Stage2CellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 22.06.2024.
//

import SwiftUI

struct Stage2CellView: View {
    let training: Training
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            VStack(alignment: .leading) {
                if let stage2 = training.stage2?.allObjects as? [Stage2]{
                    ForEach(stage2) { task in
                    HStack {
                        Circle()
                            .foregroundStyle(.blueApp)
                            .frame(width: 13)
                        Text(task.titleTask ?? "")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                }
            }
                
            }.padding()
        }
        .frame(width: .infinity, height: 185)
        .cornerRadius(15)
    }
}

#Preview {
    Stage2CellView(training: Training())
}
