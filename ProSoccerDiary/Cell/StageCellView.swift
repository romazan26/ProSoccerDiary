//
//  TrainingCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct StageCellView: View {
    let training: Training
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            if let stage1 = training.stage1?.allObjects as? [Stage1]{
                HStack{
                    VStack(alignment: .leading) {
                        
                        ForEach(stage1) { task in
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
                    Button {
                        vm.deleteStage(with: training.id)
                    } label: {
                        Image(systemName: "trash.fill").foregroundStyle(.white)
                    }
                }.padding()
            }
        }
        .frame(width: .infinity, height: 185)
        .cornerRadius(15)
    }
}

//#Preview {
//    StageCellView(training: Training())
//}
