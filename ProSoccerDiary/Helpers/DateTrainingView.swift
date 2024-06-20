//
//  DateTrainingView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct DateTrainingView: View {
    var date: Date
    var body: some View {
        ZStack {
            Color.mainApp
            Text(Dateformatter(date: date))
                .foregroundStyle(.white)
                .font(.system(size: 12,weight: .heavy))
                .padding(3)
        }
        .frame(width: 75, height: 30)
        .cornerRadius(29)
    }
}

#Preview {
    DateTrainingView(date: Date.now)
}

//MARK: - Dateformatter
private func Dateformatter(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d.M.yyyy"
    return dateFormatter.string(from: date)
}
