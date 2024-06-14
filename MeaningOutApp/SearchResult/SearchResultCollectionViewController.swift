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
    
    private let searchCountLabel: UILabel = {
       let label = UILabel()
        label.text = Constant.SearchResultStrings.result.rawValue
        label.textColor = Constant.FontColors.mainOrange
        label.font = Constant.FontStyles.bold13
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureCollectionView()
        configureUI()
    }
    
    private func configureHierarchy() {
        view.addSubview(searchCountLabel)
    }
    
    private func configureLayout() {
        searchCountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
    }
    
    private func configureCollectionView() {
        
    }
    
    private func configureUI() {
        view.backgroundColor = Constant.FontColors.white
        if let query = searchQuery {
            self.navigationItem.title = query
        }
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: Constant.ButtonImages.backButton, style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = Constant.FontColors.black
    }
    

}
