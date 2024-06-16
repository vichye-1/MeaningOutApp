//
//  SearchResultCollectionViewCell.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/16/24.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    let shoppingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let likeButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        return button
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        label.numberOfLines = 2
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
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
