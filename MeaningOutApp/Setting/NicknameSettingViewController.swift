//
//  NicknameSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit
import SnapKit

class NicknameSettingViewController: UIViewController {
    
    var currentProfile = 0
    
    let profileButton: UIButton = {
        let button = UIButton()
        var randomIdx = Int.random(in: 0...11)
        button.setImage(UIImage(named: "profile_\(randomIdx)"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.borderWidth = 3
        button.layer.borderColor = Constant.Colors.mainOrange.cgColor
        button.layer.cornerRadius = 55
        button.layer.masksToBounds = true
        return button
    }()
    
    private let nicknameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.textColor = Constant.Colors.black
        textfield.placeholder = Constant.NicknameStrings.inputNickname.rawValue
        textfield.font = Constant.FontSize.regular13
        textfield.textAlignment = .left
        return textfield
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = Constant.Colors.lightGray
        return view
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.NicknameStrings.rightNickname.rawValue
        label.font = Constant.FontSize.regular13
        label.textColor = Constant.Colors.mainOrange
        label.textAlignment = .left
        return label
    }()
    
    private let completeButton = OrangeButton(title: Constant.OtherStrings.complete.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        completeButton.addTarget(self, action: #selector(completeButtonClicked), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .touchUpInside)
    }
    
    @objc func completeButtonClicked() {
        UserDefaults.standard.set(true, forKey: "isUser")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let rootViewController = TabBarController()
        sceneDelegate?.window?.rootViewController = rootViewController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    @objc func profileButtonClicked() {
        navigationController?.pushViewController(ProfileImageSettingViewController(), animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(profileButton)
        view.addSubview(nicknameTextfield)
        view.addSubview(underlineView)
        view.addSubview(stateLabel)
        view.addSubview(completeButton)
    }
    
    func configureLayout() {
        profileButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(110)
        }
        nicknameTextfield.snp.makeConstraints { make in
            make.top.equalTo(profileButton.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
        underlineView.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextfield.snp.bottom)
            make.horizontalEdges.equalTo(nicknameTextfield)
            make.height.equalTo(1)
        }
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(underlineView)
            make.height.equalTo(24)
        }
        completeButton.snp.makeConstraints { make in
            make.top.equalTo(stateLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(stateLabel)
            make.height.equalTo(44)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = Constant.TabBarTitles.profileSetting.rawValue
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = Constant.Colors.black
        
    }
    
    
}