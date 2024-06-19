//
//  PlayerViewModel.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import Foundation
import CoreData
import UIKit

final class PlayerViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var players: [Players] = []
    
    @Published var simpleName = ""
    @Published var simpleAge = ""
    @Published var simpleTeam = ""
    @Published var pickerResult: [UIImage] = []
    
    
    //MARK: - Get Players
    func getPlayers(){
        let request = NSFetchRequest<Players>(entityName: "Players")
        
        do{
            players = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Add Player
    func addPlayer(){
        let newPlayer = Players(context: manager.context)
        newPlayer.name = simpleName
        newPlayer.team = simpleTeam
        newPlayer.age = simpleAge
        if !pickerResult.isEmpty {
            newPlayer.image = pickerResult.first
        }
        
    }
    
    //MARK: - Save data
    func save(){
        players.removeAll()
        manager.save()
        getPlayers()
    }
}
