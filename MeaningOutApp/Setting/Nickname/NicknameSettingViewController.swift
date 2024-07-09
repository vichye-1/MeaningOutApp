//
//  NicknameSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit
import SnapKit

class NicknameSettingViewController: UIViewController {
    var selectedProfileImage: String?
    var currentProfile = 0
    var currentNickname = ""
    var currentDate = ""
    var isValidateNickname = false
    
    let viewModel = NicknameViewModel()
    
    let profileButton: UIButton = {
        let button = UIButton()
        var randomImage = "profile_\(Int.random(in: 0...11))"
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
        label.text = Constant.NicknameStrings.countFail.rawValue
        label.font = Constant.FontSize.regular13
        label.textColor = Constant.Colors.mainOrange
        label.textAlignment = .left
        return label
    }()
    
    let completeButton = OrangeButton(title: Constant.OtherStrings.complete.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        completeButton.addTarget(self, action: #selector(completeButtonClicked), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .touchUpInside)
        nicknameTextfield.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loadProfileImage()
        bindData()
    }
    
    func bindData() {
        viewModel.outputValidationText.bind { value in
            self.stateLabel.text = value
        }
        viewModel.outputValid.bind { value in
            self.completeButton.isEnabled = value
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateProfileImage()
    }
    
    func loadProfileImage() {
        if let imageName = UserDefaults.standard.string(forKey: "profileImage") {
            selectedProfileImage = imageName
            profileButton.setImage(UIImage(named: imageName), for: .normal)
        } else {
            setInitialRandomImage()
        }
    }
    
    func updateProfileImage() {
        if let imageName = selectedProfileImage {
            profileButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    @objc func completeButtonClicked() {
        convertDate()
        UserDefaults.standard.set(true, forKey: "isUser")
        currentNickname = nicknameTextfield.text ?? "옹골찬 고래밥"
        UserDefaults.standard.set(currentNickname, forKey: "nickname")
        UserDefaults.standard.set(currentDate, forKey: "currentDate")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let rootViewController = TabBarController()
        sceneDelegate?.window?.rootViewController = rootViewController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    @objc func profileButtonClicked() {
        let profileImageVC = ProfileImageSettingViewController()
        profileImageVC.initialProfileImage = selectedProfileImage ?? UserDefaults.standard.string(forKey: "profileImage")
        profileImageVC.delegate = self
        navigationController?.pushViewController(profileImageVC, animated: true)
    }
    
    @objc func textFieldDidChange() {
        viewModel.inputNickname.value = nicknameTextfield.text
    }
    
    func configureHierarchy() {
        view.addSubview(profileButton)
        view.addSubview(nicknameTextfield)
        view.addSubview(underlineView)
        view.addSubview(stateLabel)
        view.addSubview(completeButton)
        view.addSubview(cameraButton)
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
        if isValidateNickname {
            completeButton.isEnabled = true
        } else {
            completeButton.isEnabled = false
        }
    }
    
    func convertDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let currentDateString = formatter.string(from: Date())
        currentDate = currentDateString
    }
    
    func setInitialRandomImage() {
        let randomImage = "profile_\(Int.random(in: 0...11))"
        profileButton.setImage(UIImage(named: randomImage), for: .normal)
        selectedProfileImage = randomImage
        UserDefaults.standard.set(randomImage, forKey: "profileImage")
    }
}

extension NicknameSettingViewController: ProfileImageDelegate {
    func selectProfileImage(imageName: String) {
        selectedProfileImage = imageName
        updateProfileImage()
    }
}
