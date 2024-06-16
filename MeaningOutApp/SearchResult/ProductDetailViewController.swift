//
//  ProductDetailViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/16/24.
//

import UIKit
import WebKit

class ProductDetailViewController: UIViewController {
    
    var productName: String = ""
    var productLink: String = ""
    var isLiked: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    private func configureHierarchy() {
        
    }
    
    private func configureLayout() {
        
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = productName
    }
    
}
