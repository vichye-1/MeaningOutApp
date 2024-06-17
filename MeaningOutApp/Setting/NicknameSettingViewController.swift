//
//  NicknameSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit
import SnapKit

class NicknameSettingViewController: UIViewController {
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile_\(Int.random(in: 0...11))"), for: .normal)
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
        textfield.textColor = Constant.Colors.gray
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(profileButton)
        view.addSubview(nicknameTextfield)
        view.addSubview(underlineView)
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
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = Constant.TabBarTitles.profileSetting.rawValue
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = Constant.Colors.black
        
    }
    
    
}
