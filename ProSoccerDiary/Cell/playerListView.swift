//
//  genreLstView.swift
//  Movieplanner
//
//  Created by Роман on 10.06.2024.
//

import SwiftUI

struct playerListView: View {
    var players: [Players]
    let screenWidth = 2
    var groupedItems: [[Players]] = [[Players]]()
    
    init(items: [Players]) {
        
        self.players = items
        groupedItems = createGroupItems(items)
    }
    
    private  func createGroupItems(_ items: [Players]) -> [[Players]]{
        var groupedItems: [[Players]] = [[Players]]()
        var tempItems: [Players] = [Players]()
        var count = 0
        
        for player in items {
            
            if count < screenWidth {
                count += 1
                tempItems.append(player)
            }else {
                count = 0
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(player)
            }
        }
        groupedItems.append(tempItems)
        
        return groupedItems
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(groupedItems, id: \.self) { subItem in
                HStack{
                    ForEach(subItem, id: \.self) { player in
                        NavigationLink {
                            PlayerInfoView(player: player)
                        } label: {
                            PlayerCellView(player: player)
                        }
                    }
                }
            }
        }
    }
}

