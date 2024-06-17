//
//  ProfileImageSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit

class ProfileImageSettingViewController: UIViewController {
    
    lazy var buttons0 = [profileButtonImage0, profileButtonImage1, profileButtonImage2, profileButtonImage3]
    lazy var buttons1 = [profileButtonImage4, profileButtonImage5, profileButtonImage6, profileButtonImage7]
    lazy var buttons2 = [profileButtonImage8, profileButtonImage9, profileButtonImage10, profileButtonImage11]

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
    
    private let stackView0 = MakeStackView()
    private let stackView1 = MakeStackView()
    private let stackView2 = MakeStackView()
    
    private let profileButtonImage0 = ProfileImageButton(name: Constant.ImageViews.profile0!)
    private let profileButtonImage1 = ProfileImageButton(name: Constant.ImageViews.profile1!)
    private let profileButtonImage2 = ProfileImageButton(name: Constant.ImageViews.profile2!)
    private let profileButtonImage3 = ProfileImageButton(name: Constant.ImageViews.profile3!)
    private let profileButtonImage4 = ProfileImageButton(name: Constant.ImageViews.profile4!)
    private let profileButtonImage5 = ProfileImageButton(name: Constant.ImageViews.profile5!)
    private let profileButtonImage6 = ProfileImageButton(name: Constant.ImageViews.profile6!)
    private let profileButtonImage7 = ProfileImageButton(name: Constant.ImageViews.profile7!)
    private let profileButtonImage8 = ProfileImageButton(name: Constant.ImageViews.profile8!)
    private let profileButtonImage9 = ProfileImageButton(name: Constant.ImageViews.profile9!)
    private let profileButtonImage10 = ProfileImageButton(name: Constant.ImageViews.profile10!)
    private let profileButtonImage11 = ProfileImageButton(name: Constant.ImageViews.profile11!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(profileButton)
        view.addSubview(stackView0)
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        
        [profileButtonImage0, profileButtonImage1, profileButtonImage2, profileButtonImage3].forEach {
            stackView0.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(handleProfileButtonTap), for: .touchUpInside)
        }
        [profileButtonImage4, profileButtonImage5, profileButtonImage6, profileButtonImage7].forEach {
            stackView1.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(handleProfileButtonTap), for: .touchUpInside)
        }
        [profileButtonImage8, profileButtonImage9, profileButtonImage10, profileButtonImage11].forEach {
            stackView2.addArrangedSubview($0)
            $0.addTarget(self, action: #selector(handleProfileButtonTap), for: .touchUpInside)
        }
    }
    
    @objc func handleProfileButtonTap(_ sender: ProfileImageButton) {
            (buttons0 + buttons1 + buttons2).forEach { $0.isSelected = false }
            sender.isSelected = true
            profileButton.setImage(sender.image(for: .normal), for: .normal)
        }
    
    func configureLayout() {
        profileButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(110)
        }
        
        stackView0.snp.makeConstraints { make in
            make.top.equalTo(profileButton.snp.bottom).offset(54)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(75)
        }
        
        for button in buttons0 {
            button.snp.makeConstraints { make in
                make.width.height.equalTo(stackView0.snp.height)
            }
        }
        
        stackView1.snp.makeConstraints { make in
            make.top.equalTo(stackView0.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(75)
        }
        
        for button in buttons1 {
            button.snp.makeConstraints { make in
                make.width.height.equalTo(stackView1.snp.height)
            }
        }
        
        stackView2.snp.makeConstraints { make in
            make.top.equalTo(stackView1.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(75)
        }
        
        for button in buttons2 {
            button.snp.makeConstraints { make in
                make.width.height.equalTo(stackView2.snp.height)
            }
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = Constant.TabBarTitles.profileSetting.rawValue
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = Constant.Colors.black
    }
}
