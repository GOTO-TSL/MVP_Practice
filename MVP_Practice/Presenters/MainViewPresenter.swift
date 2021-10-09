//
//  MainViewPresenter.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import Foundation

protocol MainViewPresenterInput {
    func answerButtonPressed(_ mainViewPresenter: MainViewPresenter, number: String)
}

protocol MainViewPresenterOutput {
    func didGetPokeModel(_ mainViewPresenter: MainViewPresenter, pokeModel: PokeModel)
}

class MainViewPresenter {
    
    let view: MainViewPresenterOutput
    var model: PokeDataManager
    
    init(view: MainViewPresenterOutput) {
        self.view = view
        self.model = PokeDataManager()
        model.delegate = self
    }
    
    func answerButtonPressed(number: String) {
        // モデルに処理を依頼
        model.featchPoke(number: number)
    }
}
// MARK: - PokeDataManagerDelegate Methods
extension MainViewPresenter: PokeDataManagerDelegate {
    func didGetPoke(_ pokeDataManager: PokeDataManager, pokeModel: PokeModel) {
        view.didGetPokeModel(self, pokeModel: pokeModel)
    }
}
