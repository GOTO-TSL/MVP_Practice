//
//  PokeDataManager.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import Foundation

struct PokeDataManager {
    
    func featchPoke() {
        let urlString = "https://pokeapi.co/api/v2/pokemon-species/836"
        guard let url = URL(string: urlString) else { fatalError() }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else { fatalError() }
            let pokeModel = parseJSON(safeData)
            guard let flavor = pokeModel?.text else { return }
            print(flavor)
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> PokeModel? {
        do {
            let decodedData = try JSONDecoder().decode(PokeData.self, from: data)
            var pokeModel = PokeModel()
            pokeModel.name = decodedData.name
            pokeModel.text = decodedData.flavor_text_entries[0].flavor_text
            return pokeModel
        } catch {
            print(error)
            return nil
        }
    }
}
