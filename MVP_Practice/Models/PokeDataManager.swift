//
//  PokeDataManager.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import Foundation

protocol PokeDataManagerDelegate {
    func didGetPoke(_ pokeDataManager: PokeDataManager, pokeModel: PokeModel)
    func didGetPokeImage(_ pokeDataManager: PokeDataManager, pokeModel: PokeModel)
}

struct PokeDataManager {
    
    var delegate: PokeDataManagerDelegate?
    
    func featchPoke(number: String) {
        let urlString = "https://pokeapi.co/api/v2/pokemon-species/\(number)"
        guard let url = URL(string: urlString) else { fatalError() }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else { fatalError() }
            let pokeModel = parseJSON(safeData)
            guard let pokeModelSafty = pokeModel else { fatalError() }
            self.delegate?.didGetPoke(self, pokeModel: pokeModelSafty)
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
    
    func featchPokeImage(name: String) {
        let urlString = "https://pokeapi.co/api/v2/pokemon/ditto"
        guard let url = URL(string: urlString) else { fatalError() }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else { fatalError() }
            let pokeModel = parseJSONImage(safeData)
            guard let pokeModelSafty = pokeModel else { fatalError() }
            self.delegate?.didGetPokeImage(self, pokeModel: pokeModelSafty)
        }
        task.resume()
    }
    
    func parseJSONImage(_ data: Data) -> PokeModel? {
        do {
            let decodedData = try JSONDecoder().decode(PokeVsData.self, from: data)
            var pokeModel = PokeModel()
            pokeModel.image = decodedData.sprites.versions.generation_v.blackwhite.animated.front_default
            return pokeModel
        } catch {
            print(error)
            return nil
        }
    }
}
