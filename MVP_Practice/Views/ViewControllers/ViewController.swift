//
//  ViewController.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import UIKit

class ViewController: UIViewController {
    
    var quizLabel: UILabel!
    var answerLabel: UILabel!
    var textField: UITextField!
    var pickerView: UIPickerView!
    var answerButton: UIButton!
    
    var presenter: MainViewPresenter!
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var pickers = [0: "0", 1: "0", 2: "0"]
    var pbnumber = "1"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainViewPresenter(view: self)
        configureUI()
        
    }
    
    func configureUI() {
        let mainView = View()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        quizLabel = mainView.quizLabel
        answerLabel = mainView.answerLabel
        textField = mainView.textField
        pickerView = mainView.pickerView
        answerButton = mainView.answerButton
        
        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        view.addSubview(mainView)
        
        [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
        
        answerButton.addTarget(self, action: #selector(answer(_ :)), for: .touchUpInside)
    }
    
    @objc func answer(_ sender: UIButton) {
        // presenterに通知
        presenter.answerButtonPressed(number: pbnumber)
    }

}
// MARK: - UIPickerViewDataSource Methods
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numbers[row]
    }
    
}

// MARK: - UIPickerViewDelegate Methods
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickers[component] = numbers[row]
        let hundred = pickers[0] ?? "0"
        let ten = pickers[1] ?? "0"
        let one = pickers[2] ?? "0"
        
        let number = Int(hundred + ten + one)!
        if number <= 898 {
            pbnumber = String(number)
        }
    }
}

// MARK: - MainViewPresenterOutput Methods
extension ViewController: MainViewPresenterOutput {
    func didGetPokeModel(_ mainViewPresenter: MainViewPresenter, pokeModel: PokeModel) {
        DispatchQueue.main.async {
            self.quizLabel.text = pokeModel.name
            self.answerLabel.text = pokeModel.text
        }
    }
}

// MARK: - UITextFieldDelegate Methods
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.endEditing(true)
        guard let text = textField.text else { return }
        print(text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}

