//
//  ViewController.swift
//  WemoTest
//
//  Created by kidnapper on 2019/8/29.
//  Copyright © 2019 andrew54068. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let testText: String = """
隱私權政策
為了讓您能夠安心的使用威摩科技官方網站（以下簡稱「本網站」）的各項服務與資訊，特此向您說明本網站的隱私權保護政策，以保障您的權益，請您詳閱下列內容：

一、隱私權保護政策的適用範圍

隱私權保護政策內容，包括本網站如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本網站以外的相關連結網站，也不適用於非本網站所委託或參與管理的人員。
    
"""
    
    private let buttonWidth: CGFloat = 90
    private let buttonHeight: CGFloat = 90

    lazy var ActionButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Action", for: .normal)
        button.addTarget(self, action: #selector(showPopup(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var CancelButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Cancel", for: .normal)
        button.addTarget(self, action: #selector(showPopup(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var ConfirmButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Confirm", for: .normal)
        button.addTarget(self, action: #selector(showPopup(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUI()
    }
    
    private func setupUI() {
        buttonStackView.addArrangedSubview(ActionButton)
        buttonStackView.addArrangedSubview(CancelButton)
        buttonStackView.addArrangedSubview(ConfirmButton)
        
        view.addSubview(buttonStackView)
        
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        ActionButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        ActionButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        CancelButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        CancelButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        ConfirmButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        ConfirmButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
    }
    
    @objc private func showPopup(sender: UIButton) {
        let buttonModels: [AlertButtonModel] = [
            AlertButtonModel(buttonText: "OK",
                             buttonTextColor: .darkGray,
                             buttonColor: .green,
                             buttonAction: { vc in
                                vc.dismiss(animated: true, completion: nil)
                                print("do something")
            }),
            AlertButtonModel(buttonText: "Cancel",
                             buttonTextColor: .red,
                             buttonColor: .green,
                             buttonAction: { vc in
                                vc.dismiss(animated: true, completion: nil)
                                print("do something")
            }),
            AlertButtonModel(buttonText: "Action1",
                             buttonTextColor: .lightGray,
                             buttonColor: .green,
                             buttonAction: { vc in
                                vc.dismiss(animated: true, completion: nil)
                                print("do something")
            }),
            AlertButtonModel(buttonText: "Action2",
                             buttonTextColor: .lightGray,
                             buttonColor: .green,
                             buttonAction: { vc in
                                vc.dismiss(animated: true, completion: nil)
                                print("do something")
            }),
        ]
        let popupVC: PopupViewController = PopupViewController(alertText: testText,
                                                               buttonModels: buttonModels)
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        present(popupVC, animated: true, completion: nil)
    }

}

class PopupViewController: UIViewController {
    
    private var popupModel: (message: String, buttonModels: [AlertButtonModel])?
    
    private let buttonHeight: CGFloat = 50
    
    private lazy var alertView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .white
        view.setCornerRadius(value: 5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textView: UITextView = {
        let textView: UITextView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.textColor = .darkGray
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    init(alertText: String, buttonModels: [AlertButtonModel]) {
        super.init(nibName: nil, bundle: nil)
        popupModel = (alertText, buttonModels)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        setupUI(from: popupModel)
    }
    
    private func setupUI(from model: (message: String, buttonModels: [AlertButtonModel])?) {
        guard let model = model else { return }
        view.addSubview(alertView)
        alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        alertView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8).isActive = true
        
        let buttons: [UIButton] = generatorButtons(from: model.buttonModels)
        buttons.forEach {
            buttonStackView.addArrangedSubview($0)
            $0.widthAnchor.constraint(equalTo: buttonStackView.widthAnchor, multiplier: 1).isActive = true
            $0.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        }
        
        alertView.addSubview(textView)
        textView.text = model.message
        alertView.addSubview(buttonStackView)
        
        textView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 10).isActive = true
        textView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10).isActive = true
        textView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10).isActive = true
        textView.layoutIfNeeded()
        if textView.contentSize.height + buttonHeight * CGFloat(model.buttonModels.count) > view.bounds.height * 0.8 {
            textView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.8 - buttonHeight * CGFloat(model.buttonModels.count) - 20).isActive = true
        } else {
            textView.heightAnchor.constraint(equalToConstant: textView.contentSize.height).isActive = true
        }

        buttonStackView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
    }
    
    private func generatorButtons(from models: [AlertButtonModel]) -> [UIButton] {
        return models.enumerated().map({ index, model in
            let button: UIButton = UIButton()
            button.setTitle(model.buttonText, for: .normal)
            button.setTitleColor(model.buttonTextColor, for: .normal)
            button.backgroundColor = model.buttonColor
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            button.tag = index
            return button
        })
    }
    
    @objc private func buttonClicked(sender: UIButton) {
        guard let models: [AlertButtonModel] = popupModel?.buttonModels,
            sender.tag < models.count else { return }
        models[sender.tag].buttonAction(self)
    }
    
}

struct AlertButtonModel {
    let buttonText: String
    let buttonTextColor: UIColor
    
    let buttonColor: UIColor
    let buttonAction: (UIViewController) -> ()
    
    init(buttonText: String,
         buttonTextColor: UIColor,
         buttonColor: UIColor,
         buttonAction: @escaping (UIViewController) -> Void) {
        self.buttonText = buttonText
        self.buttonTextColor = buttonTextColor
        self.buttonColor = buttonColor
        self.buttonAction = buttonAction
    }
    
}

extension UIView {
    
    func setCornerRadius(value: CGFloat) {
        layer.cornerRadius = value
        clipsToBounds = true
    }
    
}
