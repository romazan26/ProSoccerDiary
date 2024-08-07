//
//  Stage3CellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 22.06.2024.
//

import SwiftUI

struct Stage3CellView: View {
    let training: Training
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            if let stage3 = training.stage3?.allObjects as? [Stage3]{
                HStack{
                    VStack(alignment: .leading) {
                        ForEach(stage3) { task in
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
                    //MARK: - delete Training
                    Button {vm.deleteStage3(with: training.id)}
                    label: {Image(systemName: "trash.fill").foregroundStyle(.white)}
                }.padding()
            }
        }
        .frame(width: .infinity, height: 185)
        .cornerRadius(15)
    }
}

#Preview {
    Stage3CellView(training: Training(), vm: TrainingsViewModel())
}
