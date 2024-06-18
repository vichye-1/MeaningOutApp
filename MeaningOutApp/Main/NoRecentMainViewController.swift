//
//  NoRecentMainViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit
import Alamofire
import SnapKit

final class NoRecentMainViewController: UIViewController {
    
    var page = 1
    var currentQuery: String?
    var totalItems: Int = 0
    let userNickname = UserDefaults.standard.string(forKey: "nickname")
    
    var shoppingList = ShoppingResult(total: 0, start: 0, display: 0, items: [])
    
    private let shoppingSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constant.SearchBarPlaceHolder.mainPlaceHolder.rawValue
        return searchBar
    }()
    
    private let noRecentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ImageViews.noRecent
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.OtherStrings.noRecent.rawValue
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = Constant.Colors.black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        
        shoppingSearchBar.delegate = self
    }
    
    private func configureHierarchy() {
        view.addSubview(shoppingSearchBar)
        view.addSubview(noRecentImageView)
        view.addSubview(emptyLabel)
    }
    
    private func configureLayout() {
        shoppingSearchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        noRecentImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.height.equalTo(noRecentImageView.snp.height)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(noRecentImageView.snp.bottom).offset(4)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "\(userNickname!)님의 MEANING OUT"
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = Constant.Colors.black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func callRequestShopping(query: String) {
        let url = ShoppingURL.shoppingURL
        let parameter: Parameters = [
            APIParameterAndHeaders.query: query,
            APIParameterAndHeaders.display: 30
        ]
        let header: HTTPHeaders = [
            APIParameterAndHeaders.naverId: ShoppingKeys.id,
            APIParameterAndHeaders.naverSecret: ShoppingKeys.secret
        ]
        
        AF.request(url, method: .get, parameters: parameter, headers: header).responseDecodable(of: ShoppingResult.self) { response in
            switch response.result {
            case .success(let value):
                if self.page == 1{
                    self.shoppingList = value
                    self.totalItems = value.total
                } else {
                    self.shoppingList.items.append(contentsOf: value.items)
                }
                self.showSearchResults()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showSearchResults() {
        let searchResultVC = SearchResultCollectionViewController()
        searchResultVC.shoppingList = self.shoppingList
        searchResultVC.searchQuery = currentQuery
        searchResultVC.currentTotal = totalItems
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
}

extension NoRecentMainViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        guard let keyword = shoppingSearchBar.text, !keyword.isEmpty else { return }
        currentQuery = keyword
        callRequestShopping(query: keyword)
        
    }
}
