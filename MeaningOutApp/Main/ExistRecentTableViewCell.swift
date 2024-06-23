//
//  ExistRecentTableViewCell.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/20/24.
//

import UIKit
import SnapKit

protocol existRecentTableViewCellDelegate: AnyObject {
    func removeButtonTapped(cell: ExistRecentTableViewCell)
}

class ExistRecentTableViewCell: UITableViewCell {
    
    weak var delegate: existRecentTableViewCellDelegate?
    
    private let timerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ButtonImages.clockButton
        imageView.tintColor = Constant.Colors.black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let keywordLabel: UILabel = {
        let label = UILabel()
        label.tintColor = Constant.Colors.black
        label.textAlignment = .left
        return label
    }()
    
    private let removeButton: UIButton = {
       let button = UIButton()
        button.setImage(Constant.ButtonImages.closeButton, for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = Constant.Colors.black
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setHierarchy()
        setLayout()
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
    }
    
    private func setHierarchy() {
        contentView.addSubview(timerImageView)
        contentView.addSubview(keywordLabel)
        contentView.addSubview(removeButton)
    }
    
    private func setLayout() {
        timerImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        keywordLabel.snp.makeConstraints { make in
            make.leading.equalTo(timerImageView.snp.trailing).offset(16)
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(removeButton.snp.leading).inset(-16)
        }
        removeButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
    }
    
    func setSearchLabel(keyword: String) {
        keywordLabel.text = keyword
        keywordLabel.font = Constant.FontSize.regular15
    }
    
    @objc
    private func removeButtonTapped() {
        delegate?.removeButtonTapped(cell: self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
