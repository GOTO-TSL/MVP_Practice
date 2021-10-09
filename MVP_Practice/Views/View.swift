//
//  View.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import UIKit

class View: UIView {
    // MARK: - Properties
    let quizLabel: UILabel = {
        let label = UILabel()
        label.text = "図鑑説明：〇〇このポケモンは？"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.text = "結果"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "答えを入力"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5.0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let answerButton: UIButton = {
        let button = UIButton()
        button.setTitle("回答", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stack = UIStackView(arrangedSubviews: [quizLabel, answerLabel, textField])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        addSubview(answerButton)
        
        [
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150),
            stack.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            answerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            answerButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 20)
        ].forEach { $0.isActive = true }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
