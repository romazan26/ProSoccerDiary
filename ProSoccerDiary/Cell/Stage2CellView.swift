//
//  Stage2CellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 22.06.2024.
//

import SwiftUI

struct Stage2CellView: View {
    let training: Training
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            if let stage2 = training.stage2?.allObjects as? [Stage2]{
                HStack{
                    VStack(alignment: .leading) {
                        
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
                    //MARK: - delete Training
                    Button {vm.deleteStage2(with: training.id)}
                    label: {Image(systemName: "trash.fill").foregroundStyle(.white)}
                    
                }.padding()
            }
            
        }.frame(width: .infinity, height: 185)
            .cornerRadius(15)
    }
}

#Preview {
    Stage2CellView(training: Training(), vm: TrainingsViewModel())
}
