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
          if isSelected {
              layer.borderWidth = 3
              layer.borderColor = Constant.Colors.mainOrange.cgColor
              alpha = 1.0
          } else {
              layer.borderWidth = 1
              layer.borderColor = Constant.Colors.black.cgColor
              alpha = 0.5
          }
       }
    }
    
    init(name: UIImage) {
        super.init(frame: .zero)
        setImage(name, for: .normal)
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
