//
//  TextFieldGroupView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct TextFieldGroupView: View {
    @Binding var text: String
    @Binding var text2: String
    @Binding var text3: String
    @Binding var text4: String
    
    
    @State private var tasktextField = -1

    var body: some View {
        ZStack {
            Color.mainApp
            VStack {
                if tasktextField >= 0 {
                    CustomTextFieldView(placeholder: "", text: $text)
                }
                if tasktextField > 0 {
                    CustomTextFieldView(placeholder: "", text: $text2)
                }
                if tasktextField > 1 {
                    CustomTextFieldView(placeholder: "", text: $text3)
                }
                if tasktextField > 2 {
                    CustomTextFieldView(placeholder: "", text: $text4)
                }
                //MARK: - oneMore Task button
                if tasktextField < 3{
                    Button(action: {
                        if tasktextField < 3{
                            tasktextField += 1
                        }
                    }, label: {
                        ZStack {
                            Color.mainApp
                            Text("+").foregroundStyle(.white)
                        }
                    })
                    .frame(width: .infinity, height: 63)
                    .overlay {
                        RoundedRectangle(cornerRadius: 11)
                            .stroke(.white.opacity(0.3), lineWidth: 2)
                    }
                }
            }
        }
    }
}

#Preview {
    TextFieldGroupView(text: .constant(""), text2: .constant(""), text3: .constant(""), text4: .constant(""))
}
