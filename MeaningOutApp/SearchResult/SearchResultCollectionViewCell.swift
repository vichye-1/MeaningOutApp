//
//  SearchResultCollectionViewCell.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/16/24.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    let shoppingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let likeButton: UIButton = {
       let button = UIButton()
        button.setImage(Constant.ButtonImages.likeButton, for: .selected)
        button.setImage(Constant.ButtonImages.unselectedLikeButton, for: .normal)
        button.setBackgroundColor(Constant.Colors.lightGray, for: .normal)
        button.setBackgroundColor(Constant.Colors.white, for: .selected)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
    }
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.FontSize.regular13
        label.textColor = Constant.Colors.lightGray
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.FontSize.regular15
        label.textColor = Constant.Colors.black
        label.numberOfLines = 2
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Constant.FontSize.bold16
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionViewCellHierarchy()
        configureCollectionViewLayout()
    }
    
    private func configureCollectionViewCellHierarchy() {
        addSubview(shoppingImageView)
        addSubview(likeButton)
        addSubview(companyLabel)
        addSubview(productNameLabel)
        addSubview(priceLabel)
    }
    
    private func configureCollectionViewLayout() {
        shoppingImageView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.height.equalTo(shoppingImageView.snp.width).multipliedBy(1.3)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(shoppingImageView.snp.bottom).inset(16)
            make.trailing.equalTo(shoppingImageView.snp.trailing).inset(16)
            make.height.width.equalTo(34)
        }
        
        companyLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(shoppingImageView.snp.bottom).offset(4)
            make.height.equalTo(20)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(companyLabel.snp.bottom)
            make.height.lessThanOrEqualTo(50)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(productNameLabel.snp.bottom)
            make.height.equalTo(24)
        }
    }
    
    func configureValue(item: Items) {
        if let url = URL(string: item.image) {
            shoppingImageView.kf.setImage(with: url)
        }
        companyLabel.text = item.mallName
        productNameLabel.text = item.title.htmlEscaped
        if let priceInt = Int(item.lprice) {
            priceLabel.text = "\(priceInt.formatted())원"
        } else {
            priceLabel.text = "가격 정보 없음"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
