//
//  Untitled.swift
//  HeroesApp
//
//  Created by Rassul Turumov on 29.11.2025.
//

struct HeroModel: Decodable {
    let name : String
    let images : HeroImages
    let powerstats : PowerStats
    let appearance : Appearance
    
    struct HeroImages : Decodable {
        let md: String
        let lg: String
    }
    struct PowerStats  : Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Decodable{
      let gender: String
      let height: [String]
      let weight: [String]
    }
}
