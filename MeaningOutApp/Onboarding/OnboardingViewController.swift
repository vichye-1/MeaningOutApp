//
//  ViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    private let locoLabel: UILabel = {
        let label = UILabel()
        label.text = "MeaningOut"
        label.textColor = Constant.Colors.mainOrange
        label.font = UIFont.systemFont(ofSize: 44, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ImageViews.launch
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let startButton = OrangeButton(title: Constant.OtherStrings.start.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked() {
        navigationController?.pushViewController(NicknameSettingViewController(), animated: true)
    }
    
    private func configureHierarchy() {
        view.addSubview(locoLabel)
        view.addSubview(logoImageView)
        view.addSubview(startButton)
    }
    
    private func configureLayout() {
        locoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(100)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(82)
            make.height.equalTo(290)
            make.top.equalTo(locoLabel.snp.bottom).offset(70)
        }
        
        startButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(44)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }

}

