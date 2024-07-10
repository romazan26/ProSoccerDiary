//
//  FootballTrainingsView.swift
//  ProSoccerDiary
//
//  Created by Роман on 18.06.2024.
//

import SwiftUI

struct FootballTrainingsView: View {
    @StateObject var vm = TrainingsViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                //MARK: - background
                Color.mainApp
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack {
                        //MARK: - Title View
                        Text("Football trainings")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                        Spacer()
                        //MARK: - Settings button
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.gray)
                        }

                    }
                    ScrollView{
                        //MARK: - Favorites training
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Favorites")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            if !vm.favoriteTrainings.isEmpty{
                                
                                ForEach(vm.favoriteTrainings) { training in
                                    NavigationLink {
                                        StageView(training: training, vm: vm)
                                    } label: {
                                        TrainingCellView(vm: vm, training: training)
                                    }
                                }
                            }
                        }
                        
                        //MARK: - All training
                        VStack(alignment: .leading) {
                            HStack {
                                Text("All")
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            if !vm.allTrainings.isEmpty{
                                
                                ForEach(vm.allTrainings) { training in
                                    NavigationLink {
                                        StageView(training: training, vm: vm)
                                    } label: {
                                        TrainingCellView(vm: vm, training: training)
                                    }
                                }
                                
                            }
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
                }.padding()
            }
            .animation(.bouncy, value: vm.favoriteTrainings)
        }
        .onAppear(perform: {
            vm.sortTrainings()
        })
    }
}

#Preview {
    FootballTrainingsView()
}
