//
//  SearchResultViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit
import Alamofire
import SnapKit

class SearchResultCollectionViewController: UIViewController {

    var shoppingList: ShoppingResult?
    
    private let searchCountLabel: UILabel = {
       let label = UILabel()
        label.text = Constant.SearchResultStrings.result.rawValue
        label.textColor = Constant.FontColors.mainOrange
        label.font = Constant.FontStyles.bold13
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupCollectionView()
        setupUI()
    }
    
    private func setupHierarchy() {
        view.addSubview(searchCountLabel)
    }
    
    private func setupLayout() {
        searchCountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
    }
    
    private func setupCollectionView() {
        
    }
    
    private func setupUI() {
        view.backgroundColor = Constant.FontColors.white
    }
    

}
