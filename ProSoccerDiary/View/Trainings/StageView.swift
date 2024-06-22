//
//  StageView.swift
//  ProSoccerDiary
//
//  Created by Роман on 22.06.2024.
//

import SwiftUI

struct StageView: View {
    let training: Training
    @StateObject var vm: TrainingsViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            //MARK: - background
            Color.mainApp
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                //MARK: - Toolbar
                HStack {
                    //MARK: - Back buttom
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 10, height: 15)
                            .foregroundStyle(.white)
                    }).frame(width: 24, height: 24)
                    //MARK: - Title View
                    Text("Football trainings")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    Spacer()
                    
                   //MARK: - isFavorite
                    Image(systemName:"heart.fill").foregroundStyle(.white)
                    
                    Spacer()
                    
                    //MARK: - Date training
                    DateTrainingView(date: Date.now)
                    
                }
                //MARK: - Stage 1
                if let stage1 = training.stage1?.allObjects as? [Stage1]{
                    VStack{
                        Text("Stage 1")
                        StageCellView(training: training)
                    }
                }
                
                //MARK: - Stage 2
                if let stage2 = training.stage2?.allObjects as? [Stage2]{
                    VStack{
                        Text("Stage 2")
                        Stage2CellView(training: training)
                    }
                }
                
                //MARK: - Stage 3
                if let stage3 = training.stage3?.allObjects as? [Stage3]{
                    VStack{
                        Text("Stage 3")
                        Stage2CellView(training: training)
                    }
                }
                Spacer()
                //Bottom toolbar
                HStack{
                    //MARK: - PlayersView
                    NavigationLink {
                        FavoritePlayersView()
                    } label: {
                        CircleButtonView(image: "person.circle.fill")
                    }

                    Spacer()
                    
                    //MARK: - Add Training
                    NavigationLink {
                        NewTrainingView(vm: vm)
                    } label: {
                        CircleButtonView(image: "plus.circle.fill")
                    }
                }
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    StageView()
//}
