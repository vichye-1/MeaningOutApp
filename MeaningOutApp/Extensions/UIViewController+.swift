//
//  UIViewController+.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/24/24.
//

import UIKit

extension UIViewController {
    func quitAlert(title: String, message: String, yes: String, no: String, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yes = UIAlertAction(title: yes, style: .default) { _ in
            completionHandler()
        }
        let no = UIAlertAction(title: no, style: .destructive)
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true)
    }
}
