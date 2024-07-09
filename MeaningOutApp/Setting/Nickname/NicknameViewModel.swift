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
        
        if nickname.count >= 3 {
            print("유효성 통과")
            outputValid.value = true
            outputValidationText.value = "올바르게 잘 썼어요"
        } else {
            print("유효성 검증 오류")
            outputValid.value = false
            outputValidationText.value = "이메일은 3글자 이상, 비밀번호는 5자 이상으로 입력해주세요"
        }
    }
    /*
     let text = nicknameTextfield.text
     let disabledCharacterSet = CharacterSet(charactersIn: "@#$%")
     if text!.count < 2 || text!.count > 9 {
         stateLabel.text = Constant.NicknameStrings.countFail.rawValue
         completeButton.isEnabled = false
     } else if text?.rangeOfCharacter(from: disabledCharacterSet) != nil {
         stateLabel.text = Constant.NicknameStrings.strFail.rawValue
         completeButton.isEnabled = false
     } else if text!.contains(where: { $0.isNumber }) {
         stateLabel.text = Constant.NicknameStrings.numFail.rawValue
         completeButton.isEnabled = false
     } else {
         stateLabel.text = Constant.NicknameStrings.rightNickname.rawValue
         isValidateNickname = true
         completeButton.isEnabled = true
     }
     */
    
}
