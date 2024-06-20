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
            VStack(alignment: .leading) {
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
                }
                
                //MARK: - task group
                ScrollView{
                    HStack {
                        Text("Stage 1")
                            .font(.system(size: 16))
                        .foregroundStyle(.gray)
                        Spacer()
                    }.padding(.vertical)
                    TextFieldGroupView(text: $vm.simpleTask1Name1,
                                       text2: $vm.simpleTask1Name2,
                                       text3: $vm.simpleTask1Name3,
                                       text4: $vm.simpleTask1Name4)
                    HStack {
                        Text("Stage 2")
                            .font(.system(size: 16))
                        .foregroundStyle(.gray)
                        Spacer()
                    }.padding(.vertical)
                    TextFieldGroupView(text: $vm.simpleTask2Name1,
                                       text2: $vm.simpleTask2Name2,
                                       text3: $vm.simpleTask2Name3,
                                       text4: $vm.simpleTask2Name4)
                    HStack {
                        Text("Stage 3")
                            .font(.system(size: 16))
                        .foregroundStyle(.gray)
                        Spacer()
                    }.padding(.vertical)
                    TextFieldGroupView(text: $vm.simpleTask3Name1,
                                       text2: $vm.simpleTask3Name2,
                                       text3: $vm.simpleTask3Name3,
                                       text4: $vm.simpleTask3Name4)
                    
                }.padding(.top, 40)
                Spacer()
                
                //MARK: - Add button
                Button(action: {}, label: {
                    AddButtonView()
                })
            }.padding()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewTrainingView(vm: TrainingsViewModel())
}
