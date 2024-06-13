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
    
    private let noRecentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.ImageViews.noRecent
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    private func configureHierarchy() {
        view.addSubview(shoppingSearchBar)
        view.addSubview(noRecentImageView)
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
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "승혜님의 MEANING OUT"
    }
    

}
