//
//  TrainingCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct TrainingCellView: View {
    @StateObject var vm: TrainingsViewModel
    let training: Training
    var body: some View {
        ZStack {
            Color.grayApp.ignoresSafeArea()
            HStack {
                //MARK: - Title trainig
                Text(training.title ?? "")
                    .font(.system(size: 18, weight: .heavy))
                Spacer()
                
                //MARK: - isFavorite Training
                Button(action: {
                    vm.isFavorite(with: training.id)
                    vm.sortTrainings()
                }, label: {
                    Image(systemName: training.like ? "heart.fill" : "heart")
                })
                
                //MARK: - delete Training
                Button(action: {
                    vm.deleteTraining(with: training.id)
                    vm.sortTrainings()
                }, label: {
                    Image(systemName: "trash.fill")
                })
                
                //MARK: - Date training
                DateTrainingView(date: training.date ?? Date.now)
            }
            .padding()
            .foregroundStyle(.white)
        }
        .frame(width: 356, height: 67)
        .cornerRadius(10)
    }
}

//#Preview {
//    TrainingCellView()
//}
