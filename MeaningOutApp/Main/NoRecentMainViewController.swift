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
        self.navigationItem.title = "승혜님의 MEANING OUT"
    }
    

}
