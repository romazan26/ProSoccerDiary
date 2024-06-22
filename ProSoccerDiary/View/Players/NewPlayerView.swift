//
//  NewPlayerView.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import SwiftUI
import PhotosUI

struct NewPlayerView: View {
    @StateObject var vm: PlayerViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresented: Bool = false
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            //MARK: - background
            Color.mainApp
                .ignoresSafeArea()
            VStack {
                
                //MARK: - Toolbar
                HStack {
                    
                    //MARK: - Back buttom
                    Button(action: {dismiss()}, label: {
                        ZStack {
                            Circle().foregroundStyle(.blueApp)
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 6, height: 10)
                            .foregroundStyle(.white)
                        }
                    }).frame(width: 24, height: 24)
                    
                    Spacer()
                    
                    //MARK: - Name player
                    TitleTextField(placeholder: "Name player..", text: $vm.simpleName)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - image pencil
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundStyle(.gray)
                }.padding()
                
                VStack{
                    //MARK: - Image
                    if vm.pickerResult.isEmpty {
                        Button {
                            isPresented.toggle()
                        } label: {
                            NoPhotoView()
                        }
                        .sheet(isPresented: $isPresented, content: {
                            PhotoPicker(configuration: self.config, pickerResult: $vm.pickerResult, isPresented: $isPresented)
                        })
                    } else {
                        Image(uiImage: vm.pickerResult.first!)
                            .resizable()
                            .cornerRadius(8)
                            .frame(width: 158, height: 251)
                    }
                    CustomTextFieldView(placeholder: "Age", text: $vm.simpleAge)
                    CustomTextFieldView(placeholder: "Team now", text: $vm.simpleTeam)
                }
                Spacer()
                Button {
                    vm.addPlayer()
                    dismiss()
                } label: {
                    AddButtonView()
                }

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewPlayerView(vm: PlayerViewModel())
}
