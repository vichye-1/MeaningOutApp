//
//  MakeStackView.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/17/24.
//

import UIKit

class MakeStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        axis = .horizontal
        alignment = .fill
        distribution = .equalSpacing
        spacing = 4
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
