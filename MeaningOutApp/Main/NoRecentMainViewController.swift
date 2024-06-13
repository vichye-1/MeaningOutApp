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
        label.textColor = Constant.FontColors.black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        callRequestShopping(query: "기계식 키보드")
        
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
        self.navigationItem.title = "승혜님의 MEANING OUT"
    }
    
    func callRequestShopping(query: String) {
        let url = ShoppingURL.shoppingURL
        let parameter: Parameters = [
            "query" : query
        ]
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": ShoppingKeys.id,
            "X-Naver-Client-Secret": ShoppingKeys.secret
        ]
        AF.request(url, method: .get, parameters: parameter, headers: header).responseString { response in  // request하면 response해야함
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension NoRecentMainViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        page = 1
        guard let keyword = shoppingSearchBar.text, !keyword.isEmpty else { return }
        currentQuery = keyword
        callRequestShopping(query: keyword)
    }
}
