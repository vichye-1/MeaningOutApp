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
        let imageName = UserDefaults.standard.string(forKey: "profileImage")
        imageView.image = UIImage(named: imageName!)
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = Constant.Colors.mainOrange.cgColor
        imageView.layer.cornerRadius = 50
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = UserDefaults.standard.string(forKey: "nickname")
        label.textColor = Constant.Colors.black
        label.font = Constant.FontSize.bold16
        return label
    }()
    
    private let signUpDateLabel: UILabel = {
        let label = UILabel()
        let signUpDate = UserDefaults.standard.string(forKey: "currentDate")
        label.text = "\(signUpDate ?? "--") 가입"
        label.textColor = Constant.Colors.gray
        label.font = Constant.FontSize.regular13
        return label
    }()
    
    private let nextImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ButtonImages.nextButton
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Constant.Colors.gray
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
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(signUpDateLabel)
        contentView.addSubview(nextImage)
    }

    private func configureLayout() {
        profileImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.width.height.equalTo(100)
        }
        
        nickNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide).offset(-10)
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(34)
        }
        
        signUpDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(20)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            make.height.equalTo(24)
        }
        
        nextImage.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
