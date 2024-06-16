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
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    private let accuracyButton = SortButton(title: "  \( Constant.SearchResultStrings.sortAccuracy.rawValue)  ")
    
    private let dateButton = SortButton(title: "  \(Constant.SearchResultStrings.sortDate.rawValue)  ")
    
    private let expensiveButton = SortButton(title: "  \(Constant.SearchResultStrings.expensive.rawValue)  ")
    
    private let cheapButton = SortButton(title: "  \(Constant.SearchResultStrings.cheap.rawValue)  ")
    
    private let spacingView: UIView = {
        let view = UIView()
        return view
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
        view.addSubview(stackView)
        [accuracyButton, dateButton, expensiveButton, cheapButton, spacingView].map {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func configureLayout() {
        searchCountLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(searchCountLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(34)
        }
        
        spacingView.snp.makeConstraints { make in
            make.width.equalTo(90)
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
