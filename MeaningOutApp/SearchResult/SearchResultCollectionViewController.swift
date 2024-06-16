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
    var page = 1
    var callRequestShopping: String = ""
    
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
    
    private let searchCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: searchCollectionViewLayout())
        return collectionView
    }()
    
    static func searchCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 20
        let cellSpacing: CGFloat = 16
        let width = UIScreen.main.bounds.width - (sectionSpacing * 2) - cellSpacing
        layout.itemSize = CGSize(width: width/2, height: width/2 * 1.8)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        return layout
    }
    
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
        [accuracyButton, dateButton, expensiveButton, cheapButton, spacingView].forEach {
            stackView.addArrangedSubview($0)
        }
        view.addSubview(searchCollectionView)
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
        
        searchCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(stackView.snp.bottom).offset(16)
        }
    }
    
    private func configureCollectionView() {
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
    }
    
    private func configureUI() {
        view.backgroundColor = Constant.Colors.white
        if let query = searchQuery {
            self.navigationItem.title = query
        }
        searchCountLabel.text = "\(currentTotal.formatted())\(Constant.SearchResultStrings.result.rawValue)"
    }
}

extension SearchResultCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let shoppingList = shoppingList {
            return shoppingList.items.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        if let item = shoppingList?.items[indexPath.item] {
            cell.configureValue(item: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let shoppingList = shoppingList else {
            return
        }
        let detailVC = ProductDetailViewController()
        let item = shoppingList.items[indexPath.item]
        detailVC.productName = item.title.htmlEscaped
        detailVC.productLink = item.link
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//extension SearchResultCollectionViewController: UICollectionViewDataSourcePrefetching {
//    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        guard let shoppingList = shoppingList else {
//            return
//        }
//        for item in indexPaths {
//            if shoppingList.items.count - 2 == item.row {
//                page += 1
//                if let query = searchQuery {
//                    callRequestShopping(query: searchQuery)
//                }
//            }
//        }
//    }
//}
