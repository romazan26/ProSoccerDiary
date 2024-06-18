//
//  LoadingView.swift
//  ProSoccerDiary
//
//  Created by Роман on 18.06.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var progress: Float = 0
    @State var isPresent = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            
            //MARK: - Background
            Color.mainApp
                .frame(width: 1000, height: 852)
                .ignoresSafeArea()
            VStack{
                //MARK: - Title
                Text("ProSoccer \nDiary")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.system(size: 46, weight: .heavy))
                    .padding(.top, 160)
                
               Spacer()
      
                    //MARK: - Loading Circle
                    ProgressCircleView(progress: progress * 0.01)
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 100)
            }
            
        }
        .fullScreenCover(isPresented: $isPresent, content: {
           FootballTrainingsView()
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if progress < 100{
                    progress += 1
                }else {
                    timer.invalidate()
                   // isPresent = true
                }
            }
        })
    }
}

#Preview {
    LoadingView()
}
