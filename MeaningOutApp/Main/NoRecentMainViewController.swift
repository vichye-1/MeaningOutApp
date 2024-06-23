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
    var recentSearchList: [String] = UserDefaults.standard.stringArray(forKey: "recentSearches") ?? []
    
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
        label.font = Constant.FontSize.bold15
        label.textColor = Constant.Colors.black
        return label
    }()
    
    private let recentSearchLabel: UILabel = {
       let label = UILabel()
        label.text = "최근 검색"
        label.font = Constant.FontSize.bold15
        label.textAlignment = .left
        return label
    }()
    
    private let removeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체 삭제", for: .normal)
        button.setTitleColor(Constant.Colors.mainOrange, for: .normal)
        button.titleLabel?.font = Constant.FontSize.regular15
        return button
    }()
    
    private let recentSearchTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
        shoppingSearchBar.delegate = self
    }
    
    private func configureHierarchy() {
        view.addSubview(shoppingSearchBar)
        view.addSubview(noRecentImageView)
        view.addSubview(emptyLabel)
        view.addSubview(recentSearchLabel)
        view.addSubview(removeAllButton)
        view.addSubview(recentSearchTableView)
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
        
        recentSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(shoppingSearchBar.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(20)
        }
        
        removeAllButton.snp.makeConstraints { make in
            make.top.equalTo(shoppingSearchBar.snp.bottom).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(20)
        }
        
        recentSearchTableView.snp.makeConstraints { make in
            make.top.equalTo(recentSearchLabel.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "\(userNickname!)님의 MEANING OUT"
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = Constant.Colors.black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func configureTableView() {
        recentSearchTableView.delegate = self
        recentSearchTableView.dataSource = self
        recentSearchTableView.register(ExistRecentTableViewCell.self, forCellReuseIdentifier: ExistRecentTableViewCell.identifier)
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
                self.saveRecentSearch(query: query)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func saveRecentSearch(query: String) {
        if !recentSearchList.contains(query) {
            recentSearchList.append(query)
            UserDefaults.standard.set(recentSearchList, forKey: "recentSearches")
        }
    }
    
    private func removeSearch(index: Int) {
        recentSearchList.remove(at: index)
        UserDefaults.standard.set(recentSearchList, forKey: "recentSearches")
        recentSearchTableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
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
        recentSearchList.append(keyword)
        recentSearchTableView.reloadData()
    }
}

extension NoRecentMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = ExistRecentTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ExistRecentTableViewCell
        cell.setSearchLabel(keyword: recentSearchList[indexPath.row])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuery = recentSearchList[indexPath.row]
        currentQuery = selectedQuery
        shoppingSearchBar.text = currentQuery
        callRequestShopping(query: selectedQuery)
    }
}

extension NoRecentMainViewController: existRecentTableViewCellDelegate {
    func removeButtonTapped(cell: ExistRecentTableViewCell) {
        if let indexPath = recentSearchTableView.indexPath(for: cell) {
            removeSearch(index: indexPath.row)
        }
    }
}
