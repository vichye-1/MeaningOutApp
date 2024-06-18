//
//  OrangeButton.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit

class OrangeButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = Constant.FontSize.bold15
        setTitleColor(Constant.Colors.white, for: .normal)
        setBackgroundColor(Constant.Colors.mainOrange, for: .normal)
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
