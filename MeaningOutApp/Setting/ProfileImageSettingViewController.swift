//
//  ProfileImageSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit

protocol ProfileImageDelegate: AnyObject {
    func selectProfileImage(imageName: String)
}

class ProfileImageSettingViewController: UIViewController {
    weak var delegate: ProfileImageDelegate?
    var initialProfileImage: String?
    lazy var buttons0 = [profileButtonImage0, profileButtonImage1, profileButtonImage2, profileButtonImage3]
    lazy var buttons1 = [profileButtonImage4, profileButtonImage5, profileButtonImage6, profileButtonImage7]
    lazy var buttons2 = [profileButtonImage8, profileButtonImage9, profileButtonImage10, profileButtonImage11]
    
    let profileButton: UIButton = {
        let button = UIButton()
        let randomImage = "profile_\(Int.random(in: 0...11))"
        button.setImage(UIImage(named: randomImage), for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.borderWidth = 3
        button.layer.borderColor = Constant.Colors.mainOrange.cgColor
        button.layer.cornerRadius = 55
        button.layer.masksToBounds = true
        UserDefaults.standard.set(randomImage, forKey: "profileImage")
        return button
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(Constant.ButtonImages.cameraButton, for: .normal)
        button.contentMode = .scaleAspectFit
        button.setBackgroundColor(Constant.Colors.mainOrange, for: .normal)
        button.tintColor = Constant.Colors.white
        button.layer.cornerRadius = 15
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
        setInitialProfileImage()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isMovingFromParent {
            let selectedImageName = UserDefaults.standard.string(forKey: "profileImage") ?? initialProfileImage ?? ""
            delegate?.selectProfileImage(imageName: selectedImageName)
        }
    }
    
    func configureHierarchy() {
        view.addSubview(profileButton)
        view.addSubview(cameraButton)
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
        let imageName = sender.image(for: .normal)?.accessibilityIdentifier ?? ""
        profileButton.setImage(sender.image(for: .normal), for: .normal)
        UserDefaults.standard.set(imageName, forKey: "profileImage")
        delegate?.selectProfileImage(imageName: imageName)
    }
    
    func configureLayout() {
        profileButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(110)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.bottom.equalTo(profileButton.snp.bottom).inset(10)
            make.trailing.equalTo(profileButton.snp.trailing)
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
    
    func setInitialProfileImage() {
        guard let initialImageName = initialProfileImage else { return }
        profileButton.setImage(UIImage(named: initialImageName), for: .normal)
        let allButtons = buttons0 + buttons1 + buttons2
        if let selectedButton = allButtons.first(where: { $0.image(for: .normal)?.accessibilityIdentifier == initialImageName }) {
            selectedButton.isSelected = true
        }
        UserDefaults.standard.set(initialImageName, forKey: "profileImage")
    }
}
