//
//  Constant.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit

enum Constant {
    enum FontColors {
        static let mainOrange = UIColor(hexCode: "ef8947")
        static let black = UIColor(hexCode: "000000")
        static let gray = UIColor(hexCode: "828282")
        static let darkGray = UIColor(hexCode: "4c4c4c")
        static let lightGray = UIColor(hexCode: "cdcdcd")
        static let white = UIColor(hexCode: "ffffff")
    }
    
    enum ButtonImages {
        static let serachButton = UIImage(systemName: "magnifyingglass")
        static let personButton = UIImage(systemName: "person")
        static let nextButton = UIImage(systemName: "chevron.right")
        static let clockButton = UIImage(systemName: "clock")
        static let closeButton = UIImage(systemName: "xmark")
        static let cameraButton = UIImage(systemName: "camera.fill")
    }
    
    enum TabBarItemStrings: String {
        case search = "검색"
        case settings = "설정"
    }
    
    enum TabBarTitles: String {
        case profileSetting = "PROFILE SETTIING"
        case setting = "SETTING"
        case editProfile = "EDIT PROFILE"
    }
    
    enum SearchBarPlaceHolder: String {
        case mainPlaceHolder = "브랜드, 상품 등을 입력하세요."
    }
}
