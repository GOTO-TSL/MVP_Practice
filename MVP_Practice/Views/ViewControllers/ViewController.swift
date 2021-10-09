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
    var pickerView: UIPickerView!
    var answerButton: UIButton!
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
        let mainView = View()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        quizLabel = mainView.quizLabel
        answerLabel = mainView.answerLabel
        pickerView = mainView.pickerView
        answerButton = mainView.answerButton
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        view.addSubview(mainView)
        
        [
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
    }

}
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

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("componet:\(component), row:\(row)")
    }
}

