//
//  TrainingsViewModel.swift
//  ProSoccerDiary
//
//  Created by Роман on 20.06.2024.
//

import Foundation
import CoreData

final class TrainingsViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var trainings: [Training] = []
    @Published var Stage1: [Stage1] = []
    @Published var Stage2: [Stage2] = []
    @Published var Stage3: [Stage3] = []
    
    @Published var simpleTitleTraining = ""
    
    @Published var simpleTask1Name1 = ""
    @Published var simpleTask1Name2 = ""
    @Published var simpleTask1Name3 = ""
    @Published var simpleTask1Name4 = ""
    
    @Published var simpleTask2Name1 = ""
    @Published var simpleTask2Name2 = ""
    @Published var simpleTask2Name3 = ""
    @Published var simpleTask2Name4 = ""
    
    @Published var simpleTask3Name1 = ""
    @Published var simpleTask3Name2 = ""
    @Published var simpleTask3Name3 = ""
    @Published var simpleTask3Name4 = ""
    
    init() {
        getTraining()
        getStage1()
        getStage2()
        getStage3()
    }
    
    //MARK: - Add data
    func addTraining(){
        let newTrainig = Training(context: manager.context)
        newTrainig.title = simpleTitleTraining
        newTrainig.date = Date.now
        newTrainig.like = false
        
    }
    
    //MARK: - Get data
    func getTraining(){
       let request = NSFetchRequest<Training>(entityName: "Training")
        
        do{
            trainings = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func getStage1(){
       let request = NSFetchRequest<Stage1>(entityName: "Stage1")
        
        do{
            Stage1 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getStage2(){
       let request = NSFetchRequest<Stage2>(entityName: "Stage2")
        
        do{
            Stage2 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getStage3(){
       let request = NSFetchRequest<Stage3>(entityName: "Stage3")
        
        do{
            Stage3 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){
        trainings.removeAll()
        manager.save()
        getTraining()
    }
}

