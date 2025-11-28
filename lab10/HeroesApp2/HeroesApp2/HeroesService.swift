//
//  HeroesService.swift
//  HeroesApp
//
//  Created by Rassul Turumov on 29.11.2025.
//

import Alamofire
import Foundation

struct HeroesService {
    func fetchHero(id: Int) async throws -> HeroModel {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(urlString).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let hero = try JSONDecoder().decode(HeroModel.self, from: data)
                        continuation.resume(returning: hero)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
