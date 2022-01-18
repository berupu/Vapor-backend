//
//  Players.swift
//  
//
//  Created by be RUPU on 5/10/21.
//

import Foundation
import Fluent
import Vapor

final class Players: Model, Content {
    
    static let schema = "players"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "playersname")
    var playersname: String
    
    @Field(key: "playerImageURL")
    var playerImageURL: String
    
    @Children(for: \.$players)
    var club: [Club]
    
    @Siblings(through: PlayerTrophy.self, from: \.$players, to: \.$trophy)
    var trophys: [Trophy]
    
    
    init() {}
    
    init(id: UUID? = nil, playersname: String, playerImageURL: String) {
        self.id = id
        self.playersname = playersname
        self.playerImageURL = playerImageURL
    }
    
}
