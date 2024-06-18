//
//  MainSettingTableViewCell.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/18/24.
//

import UIKit
import SnapKit

class MainSettingTableViewCell: UITableViewCell {

    private let profileImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Constant.ImageViews.profile0
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = Constant.Colors.mainOrange.cgColor
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    
    private func configureHierarchy() {
        contentView.addSubview(profileImage)
    }

    private func configureLayout() {
        profileImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(100)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
