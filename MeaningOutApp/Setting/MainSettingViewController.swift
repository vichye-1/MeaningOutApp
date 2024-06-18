//
//  MainSettingViewController.swift
//  MeaningOutApp
//
//  Created by 양승혜 on 6/13/24.
//

import UIKit

class MainSettingViewController: UIViewController {
    
    private let profileTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
    }
    
    private func configureHierarchy() {
        view.addSubview(profileTableView)
    }
    
    private func configureLayout() {
        profileTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureUI() {
        view.backgroundColor = Constant.Colors.white
        navigationItem.title = Constant.TabBarTitles.setting.rawValue
    }
    
    private func configureTableView() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension MainSettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
//        switch indexPath.row {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MainSetting", for: indexPath) as! MainSettingTableViewCell
//            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Constant.SettingStrings.myList.rawValue
//            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Constant.SettingStrings.question.rawValue
//            return cell
//        case 3:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Constant.SettingStrings.oneByOne.rawValue
//            return cell
//        case 4:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Constant.SettingStrings.alarm.rawValue
//            return cell
//        case 5:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = Constant.SettingStrings.quit.rawValue
//            return cell
//        default:
//            return UITableViewCell()
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 150 : 50
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
}
