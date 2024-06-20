//
//  TrainingCellView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct TrainingCellView: View {
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
                Button(action: {}, label: {
                    Image(systemName: training.like ? "heart.fill" : "heart")
                })
                
                //MARK: - Date training
                DateTrainingView(date: training.date ?? Date.now)
            }
            .padding()
            .foregroundStyle(.white)
        }
        .frame(width: .infinity, height: 67)
        .cornerRadius(10)
    }
}

//#Preview {
//    TrainingCellView()
//}
