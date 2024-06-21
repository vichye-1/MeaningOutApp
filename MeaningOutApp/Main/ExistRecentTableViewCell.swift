//
//  ExistRecentTableViewCell.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/20/24.
//

import UIKit
import SnapKit

class ExistRecentTableViewCell: UITableViewCell {
    
    private let timerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ButtonImages.clockButton
        imageView.tintColor = Constant.Colors.black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setLayout()
    }
    
    private func setHierarchy() {
        contentView.addSubview(timerImageView)
    }
    
    private func setLayout() {
        timerImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
    
    func setUI() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
