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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    private func configureHierarchy() {
        view.addSubview(locoLabel)
    }
    
    private func configureLayout() {
        locoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(52)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(100)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }

}

