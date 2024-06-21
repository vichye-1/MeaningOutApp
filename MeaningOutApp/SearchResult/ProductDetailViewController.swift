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
    var isLiked: Bool = false
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let image = Constant.ButtonImages.unselectedLikeButton?.withRenderingMode(.alwaysOriginal)
        let likeButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(likeButtonClicked))
        navigationItem.rightBarButtonItem = likeButton
    }
    
    @objc func likeButtonClicked() {
        
    }
    
    private func configureWebView() {
        if let url = URL(string: productLink) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
