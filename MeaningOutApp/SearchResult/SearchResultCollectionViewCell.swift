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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionViewCellHierarchy()
        configureCollectionViewLayout()
    }
    
    private func configureCollectionViewCellHierarchy() {
        addSubview(shoppingImageView)
    }
    
    private func configureCollectionViewLayout() {
        shoppingImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
