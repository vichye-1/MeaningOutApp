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
        static let likeButton = UIImage(named: "like_selected")
        static let unselectedLikeButton = UIImage(named: "like_unselected")
    }
    
    enum ImageViews {
        static let noRecent = UIImage(named: "empty")
        static let profile0 = UIImage(named: "profile_0")
        static let profile1 = UIImage(named: "profile_1")
        static let profile2 = UIImage(named: "profile_2")
        static let profile3 = UIImage(named: "profile_3")
        static let profile4 = UIImage(named: "profile_4")
        static let profile5 = UIImage(named: "profile_5")
        static let profile6 = UIImage(named: "profile_6")
        static let profile7 = UIImage(named: "profile_7")
        static let profile8 = UIImage(named: "profile_8")
        static let profile9 = UIImage(named: "profile_9")
        static let profile10 = UIImage(named: "profile_10")
        static let profile11 = UIImage(named: "profile_11")
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
    
    enum NicknameStrings: String {
        case inputNickname = "닉네임을 입력해주세요 :)"
        case rightNickname = "사용할 수 있는 닉네임이에요"
        case countFail = "2글자 이상 10글자 미만으로 설정해주세요"
        case strFail = "닉네임에 @, #, $, % 는 포함할 수 없어요."
        case numFail = "닉네임에 숫자는 포함할 수 없어요"
    }
    
    enum OtherStrings: String {
        case complete = "완료"
        case noRecent = "최근 검색어가 없어요"
    }
}
