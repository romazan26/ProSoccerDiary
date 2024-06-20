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
                            
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.gray)
                        }

                    }
                    //MARK: - Favorites training
                    VStack {
                        Text("Favorites")
                            .foregroundStyle(.gray)
                    }
                    
                    //MARK: - All training
                    Text("All")
                        .foregroundStyle(.gray)
                    Spacer()
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
        }
    }
}

#Preview {
    FootballTrainingsView()
}
