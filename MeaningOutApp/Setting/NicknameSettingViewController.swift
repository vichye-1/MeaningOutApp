//
//  NicknameSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit
import SnapKit

class NicknameSettingViewController: UIViewController {
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = Constant.Colors.mainOrange.cgColor
        imageView.layer.cornerRadius = 65
        return imageView
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(profileImageView)
    }
    
    func configureLayout() {
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(130)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = Constant.TabBarTitles.profileSetting.rawValue
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = Constant.Colors.black
        
    }
    

}
