//
//  SortButton.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/14/24.
//

import UIKit

class SortButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
       setTitle(title, for: .normal)
       titleLabel?.font = Constant.FontSize.regular13
       setTitleColor(Constant.Colors.darkGray, for: .normal)
       setTitleColor(Constant.Colors.white, for: .highlighted)
       
       setBackgroundColor(Constant.Colors.white, for: .normal)
       setBackgroundColor(Constant.Colors.darkGray, for: .selected)
       
       layer.borderWidth = 1
       layer.borderColor = Constant.Colors.lightGray.cgColor
        layer.cornerRadius = 16
       layer.masksToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
