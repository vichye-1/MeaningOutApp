//
//  ProfileImageButton.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit

class ProfileImageButton: UIButton {
    override var isSelected: Bool {
       didSet {
           layer.borderWidth = isSelected ? 3 : 1
           layer.borderColor = isSelected ? Constant.Colors.mainOrange.cgColor : Constant.Colors.black.cgColor
           alpha = isSelected ? 1.0 : 0.5
       }
    }
    
    init(name: UIImage) {
        super.init(frame: .zero)
        setImage(name, for: .normal)
        self.accessibilityIdentifier = name.accessibilityIdentifier ?? "profile_\(Int.random(in: 0...11))"
        contentMode = .scaleAspectFill
        layer.borderWidth = 1
        layer.borderColor = Constant.Colors.black.cgColor
        layer.masksToBounds = true
        alpha = 0.5
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
