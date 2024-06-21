//
//  ProductDetailViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/16/24.
//

import UIKit
import WebKit
import SnapKit

class ProductDetailViewController: UIViewController {
    
    var productName: String = ""
    var productLink: String = ""
    var productId: String = ""
    var isLiked: Bool = false
    private var likedItems: [String] = []
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadLikedItems()
        isLiked = likedItems.contains(productId)
        configureHierarchy()
        configureLayout()
        configureUI()
        configureWebView()
    }
    
    private func configureHierarchy() {
        view.addSubview(webView)
    }
    
    private func configureLayout() {
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = productName
        self.navigationController?.navigationBar.topItem?.title = ""
        let image = isLiked ? Constant.ButtonImages.likeButton?.withRenderingMode(.alwaysOriginal) : Constant.ButtonImages.unselectedLikeButton?.withRenderingMode(.alwaysOriginal)
        let likeButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(likeButtonClicked))
        navigationItem.rightBarButtonItem = likeButton
    }
    
    @objc func likeButtonClicked() {
        isLiked.toggle()
        let imageName = isLiked ? Constant.ButtonImages.likeButton : Constant.ButtonImages.unselectedLikeButton
        let image = imageName?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem?.image = image
        if isLiked {
            if !likedItems.contains(productId) {
                likedItems.append(productId)
            }
        } else {
            if let index = likedItems.firstIndex(of: productId) {
                likedItems.remove(at: index)
            }
        }
        UserDefaults.standard.setValue(likedItems, forKey: "likedItems")
    }
    
    private func configureWebView() {
        if let url = URL(string: productLink) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    private func loadLikedItems() {
        likedItems = UserDefaults.standard.array(forKey: "likedItems") as? [String] ?? []
    }
}
