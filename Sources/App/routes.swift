import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let playerController = PlayersController()
    let clubController = ClubController()
    let trophyController = TrophyController()
    let playerTrophyController = PlayerTrophyController()

    //http://127.0.0.1:8080/players
    app.post("players", use: playerController.create)
    
    //http://127.0.0.1:8080/players/:playersid
    app.delete("players",":playersid", use: playerController.delete)
    
    
    //http://127.0.0.1:8080/club
    app.post("club", use: clubController.create)
    
    
    //http://127.0.0.1:8080/trophy
    app.post("trophy", use: trophyController.create)
    
    //http://127.0.0.1:8080/trophy/:trophyid
    app.delete("trophy", ":trophyid", use: trophyController.delete)
    
    //http://127.0.0.1:8080/player/:playerid/trophy/:trophyid
    app.post("player",":playerid","trophy",":trophyid", use: playerTrophyController.create)
    
    //http://127.0.0.1:8080/playertrophy/:trophyid/trophy
    app.get("playertrophy",":trophyid","trophy",use: playerTrophyController.getTrophywithPlayer)
    
    //http://127.0.0.1:8080/playertrophy/:playerid/player
    app.get("playertrophy",":playerid","player", use: playerTrophyController.getPlayerwithTrophy)
    
}
