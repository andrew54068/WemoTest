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
    
二、個人資料的蒐集、處理及利用方式

當您洽辦本網站業務或參與本網站活動時，我們將視業務或活動性質請您提供必要的個人資料，包括但不限於姓名、性別、身份證字號、生日、電話、電子信箱、住址及使用時間，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本網站不會將個人資料用於其他用途。
於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，絕不對外公佈。
為提供精確的服務，我們會將蒐集所得資訊進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。
三、資料之保護

本網站主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。
如因業務需要有必要委託其他單位提供服務時，本網站亦會嚴格要求其遵守保密義務，並且採取必要檢查程序以確定其將確實遵守。
四、網站對外的相關連結

本網站的網頁提供其他網站的網路連結，您也可經由本網站所提供的連結，點選進入其他網站。但該連結網站不適用本網站的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。

五、與第三人共用個人資料之政策

本網站絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。

前項但書之情形包括不限於：

經由您書面同意。
法律明文規定。
為免除您生命、身體、自由或財產上之危險。
與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集著依其揭露方式無從識別特定之當事人。
當您在網站的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。
本網站委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。
六、Cookie之使用

為了提供您最佳的服務，本網站會在您的電腦中放置並取用我們的Cookie，若您不願接受Cookie的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕Cookie的寫入，但可能會導至網站某些功能無法正常執行 。

七、隱私權保護政策之修正與諮詢

本網站隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。若對本網站中的隱私權政策有任何疑問，請與我們聯絡。
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
