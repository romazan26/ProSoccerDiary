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
    @Published var stage1: [Stage1] = []
    @Published var stage2: [Stage2] = []
    @Published var stage3: [Stage3] = []
    
    @Published var favoriteTrainings: [Training] = []
    @Published var allTrainings: [Training] = []
    
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
    
    //MARK: - Sorting trainings
    func sortTrainings(){
        favoriteTrainings.removeAll()
        allTrainings.removeAll()
        for training in trainings {
            if training.like{
                favoriteTrainings.append(training)
            }else {
                allTrainings.append(training)
            }
        }
    }
    
    //MARK: - Add data
    func addTraining(){
        let newTrainig = Training(context: manager.context)
        newTrainig.title = simpleTitleTraining
        newTrainig.date = Date.now
        newTrainig.like = false
        
    }
    func addAllTask(){
        addTaskStage1(simpleTask: simpleTask1Name1)
        addTaskStage1(simpleTask: simpleTask1Name2)
        addTaskStage1(simpleTask: simpleTask1Name3)
        addTaskStage1(simpleTask: simpleTask1Name4)
        
        addTaskStage2(simpleTask: simpleTask2Name1)
        addTaskStage2(simpleTask: simpleTask2Name2)
        addTaskStage2(simpleTask: simpleTask2Name3)
        addTaskStage2(simpleTask: simpleTask2Name4)
        
        addTaskStage3(simpleTask: simpleTask3Name1)
        addTaskStage3(simpleTask: simpleTask3Name2)
        addTaskStage3(simpleTask: simpleTask3Name3)
        addTaskStage3(simpleTask: simpleTask3Name4)
    }
    func addTaskStage1(simpleTask: String){
        if !simpleTask.isEmpty {
            let newTask = ProSoccerDiary.Stage1(context: manager.context)
            newTask.titleTask = simpleTask
            
            newTask.trainig = trainings.last
            save()
        }
    }
    func addTaskStage2(simpleTask: String){
        if !simpleTask.isEmpty {
            let newTask = ProSoccerDiary.Stage2(context: manager.context)
            newTask.titleTask = simpleTask
            
            newTask.trainig = trainings.last
            save()
        }
    }
    func addTaskStage3(simpleTask: String){
        if !simpleTask.isEmpty {
            let newTask = ProSoccerDiary.Stage3(context: manager.context)
            newTask.titleTask = simpleTask
            
            newTask.trainig = trainings.last
            save()
        }
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
            stage1 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getStage2(){
       let request = NSFetchRequest<Stage2>(entityName: "Stage2")
        
        do{
            stage2 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    func getStage3(){
       let request = NSFetchRequest<Stage3>(entityName: "Stage3")
        
        do{
            stage3 = try manager.context.fetch(request)
        }catch let error {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func save(){
        trainings.removeAll()
        stage1.removeAll()
        stage2.removeAll()
        stage3.removeAll()
        manager.save()
        getTraining()
        getStage1()
        getStage2()
        getStage3()
    }
}

