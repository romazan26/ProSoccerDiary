//
//  PlayerViewModel.swift
//  ProSoccerDiary
//
//  Created by Роман on 19.06.2024.
//

import Foundation
import CoreData

final class PlayerViewModel: ObservableObject {
    
    let manager = CoreDataManager.instance
    
    @Published var players: [Players] = []
    
    @Published var simpleName = ""
    @Published var simpleAge = 0
    @Published var simpleTeam = ""
    
    
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
        newPlayer.age = Int16(simpleAge)
        newPlayer.team = simpleTeam
    }
    
    //MARK: - Save data
    func save(){
        players.removeAll()
        manager.save()
        getPlayers()
    }
}
