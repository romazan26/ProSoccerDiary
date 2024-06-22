//
//  TitleTextField.swift
//  ProSoccerDiary
//
//  Created by Роман on 22.06.2024.
//

import SwiftUI

struct TitleTextField: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .center) {
            Color.mainApp
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.5))
                    
            }
            TextField("", text: $text)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
            .frame(height: 69)
    }
}

#Preview {
    TitleTextField( text: .constant(""))
}
