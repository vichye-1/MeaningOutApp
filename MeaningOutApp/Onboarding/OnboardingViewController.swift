//
//  ViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    private func configureHierarchy() {
        view.addSubview(locoLabel)
        view.addSubview(logoImageView)
    }
    
    private func configureLayout() {
        locoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(52)
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
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }

}

