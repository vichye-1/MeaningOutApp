//
//  RecentExistViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/18/24.
//

import UIKit
import Alamofire
import SnapKit

class RecentExistViewController: UIViewController {

    let userNickname = UserDefaults.standard.string(forKey: "nickname")
    var currentQuery: String?
    var totalItems: Int = 0
    var shoppingList = ShoppingResult(total: 0, start: 0, display: 0, items: [])
    
    private let shoppingSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constant.SearchBarPlaceHolder.mainPlaceHolder.rawValue
        return searchBar
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
    }

    private func configureLayout() {
        shoppingSearchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
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
                self.shoppingList.items.append(contentsOf: value.items)
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

extension RecentExistViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let keyword = shoppingSearchBar.text, !keyword.isEmpty else { return }
        currentQuery = keyword
        callRequestShopping(query: keyword)
    }
}

