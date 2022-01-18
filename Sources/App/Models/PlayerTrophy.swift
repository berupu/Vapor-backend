//
//  File.swift
//  
//
//  Created by be RUPU on 28/10/21.


import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

final class PlayerTrophy: Model, Content {
    
    static let schema = "player_trophy"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "player_id")
    var players: Players
    
    @Parent(key: "trophy_id")
    var trophy: Trophy
    
    init(){}
    
    init(playerid: UUID, trophyid: UUID){
        self.$players.id = playerid
        self.$trophy.id = trophyid
    }
    
}
