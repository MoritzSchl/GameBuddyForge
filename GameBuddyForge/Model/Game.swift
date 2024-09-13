//
//  Game.swift
//  GameBuddyForge
//
//  Created by Moritz Schleimer on 09.09.24.
//

import Foundation

struct Game: Codable, Identifiable{
    let id: Int
    let title: String
    let thumbnail: String
    let shortDescription: String
    let gameURL: String
    let genre: Genre
    let platform: Platform
    let publisher: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
            case id, title, thumbnail
            case shortDescription = "short_description"
            case gameURL = "game_url"
            case genre, platform, publisher
            case releaseDate = "release_date"
        }
    
}


enum Genre: String, Codable {
    case action = "Action"
    case actionGame = "Action Game"
    case actionRPG = "Action RPG"
    case arpg = "ARPG"
    case battleRoyale = "Battle Royale"
    case cardGame = "Card Game"
    case fantasy = "Fantasy"
    case fighting = "Fighting"
    case genreMMORPG = " MMORPG"
    case mmo = "MMO"
    case mmoarpg = "MMOARPG"
    case mmorpg = "MMORPG"
    case moba = "MOBA"
    case racing = "Racing"
    case shooter = "Shooter"
    case social = "Social"
    case sports = "Sports"
    case strategy = "Strategy"
}

enum Platform: String, Codable {
    case pcWindows = "PC (Windows)"
    case pcWindowsWebBrowser = "PC (Windows), Web Browser"
    case webBrowser = "Web Browser"
}

extension Game {
    var GamesImageURL: URL? {
        URL(string: thumbnail)
    }
}

extension Game {
    var gameWebsiteURL: URL? {
        URL(string: gameURL)
    }
}
extension Game {
    static var sample: Game {
        Game(id: 12, title: "Tarisland", thumbnail: "https://www.freetogame.com/g/582/thumbnail.jpg", shortDescription: "A cross-platform MMORPG developed by Level Infinite and Published by Tencent.", gameURL: "https://www.freetogame.com/open/tarisland", genre: Genre.actionGame, platform: Platform.pcWindowsWebBrowser, publisher: "Tencent", releaseDate: "2024-06-22")
    }
}
