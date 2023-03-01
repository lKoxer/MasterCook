//
//  NetworkManager.swift
//  MasterCook
//
//  Created by leogoba on 01.03.2023.
//

import Foundation

struct NetworkManager {
    let recipersURL = "https://api.spoonacular.com/recipes/complexSearch?apiKey=f0bd0ad9b5d043899798aefc74e39102"
    
    func getAllRecipes() {
        if let url = URL(string: recipersURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if parseJSON(safeData) != nil {
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ recipes: Data) -> NetworkData? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(NetworkData.self, from: recipes)
            print(decoderData.results)
            return decoderData
        } catch {
            return nil
        }
    }
}
