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
    var searchQuery: String?
    var currentTotal: Int = 0
    
    private let searchCountLabel: UILabel = {
       let label = UILabel()
        label.textColor = Constant.Colors.mainOrange
        label.font = Constant.FontSize.bold13
        return label
    }()
    
    private let accuracyButton = SortButton(title: Constant.SearchResultStrings.sortAccuracy.rawValue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureCollectionView()
        configureUI()
    }
    
    private func configureHierarchy() {
        view.addSubview(searchCountLabel)
        view.addSubview(accuracyButton)
    }
    
    private func configureLayout() {
        searchCountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
        
        accuracyButton.snp.makeConstraints { make in
            make.top.equalTo(searchCountLabel.snp.bottom).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(34)
        }
    }
    
    private func configureCollectionView() {
        
    }
    
    private func configureUI() {
        view.backgroundColor = Constant.Colors.white
        if let query = searchQuery {
            self.navigationItem.title = query
        }
        searchCountLabel.text = "\(currentTotal.formatted())\(Constant.SearchResultStrings.result.rawValue)"
    }
    

}
