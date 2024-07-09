//
//  NicknameViewModel.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 7/9/24.
//

import Foundation

class NicknameViewModel {

    var inputNickname: Observable<String?> = Observable(nil)

    var outputValidationText = Observable("")
    var outputValid = Observable(false)
    
    init() {
        print("ViewModel Init")
        inputNickname.bind { _ in
            self.validation()
        }
    }
    
    private func validation() {
        
        guard let nickname = inputNickname.value else {
            return
        }
        
        let disabledCharacterSet = CharacterSet(charactersIn: "@#$%")
        
        if nickname.count < 2 || nickname.count > 9 {
            print("letter's length error")
            outputValid.value = false
            outputValidationText.value = Constant.NicknameStrings.countFail.rawValue
        } else if nickname.rangeOfCharacter(from: disabledCharacterSet) != nil {
            print("contains special characters")
            outputValid.value = false
            outputValidationText.value = Constant.NicknameStrings.strFail.rawValue
        } else if nickname.contains(where: { $0.isNumber }) {
            print("nickname contains number")
            outputValid.value = false
            outputValidationText.value = Constant.NicknameStrings.numFail.rawValue
        } else {
            outputValid.value = true
            outputValidationText.value = Constant.NicknameStrings.rightNickname.rawValue
        }
    }
}
