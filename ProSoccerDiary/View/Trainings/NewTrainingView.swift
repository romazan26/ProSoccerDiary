//
//  NewTrainingView.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import SwiftUI

struct NewTrainingView: View {
    @StateObject var vm: TrainingsViewModel
    var body: some View {
        ZStack {
            Color.mainApp.ignoresSafeArea()
            VStack {
                //MARK: - Toolbar
                HStack {
                    
                    //MARK: - Back buttom
                    Button(action: {}, label: {
                        ZStack {
                            Circle().foregroundStyle(.blueApp)
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 6, height: 10)
                            .foregroundStyle(.white)
                        }
                    }).frame(width: 26, height: 26)
                    
                    Spacer()
                    
                    //MARK: - Name training
                    TextField("Name", text: $vm.simpleTitleTraining)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - image pencil
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(.gray)
                }.padding()
                Spacer()
            }
        }
    }
}

#Preview {
    NewTrainingView(vm: TrainingsViewModel())
}
