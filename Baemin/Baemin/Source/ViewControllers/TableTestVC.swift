//
//  TableTestVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/07.
//

import UIKit

class TableTestVC: UIViewController {
    
    //MARK: - Properties
    var tableView = UITableView(frame: .zero, style: .grouped)
    let storeList = ["하나", "둘", "하나", "둘", "하나", "둘",
                     "하나", "둘", "하나", "둘", "하나", "둘", "하나",
                     "둘", "하나", "둘", "하나", "둘", "하나", "둘", "하나", "둘", ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setupLayout()
        setupTableView()
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
    
    //MARK: - Custom Method
    private func configUI() {
        view.backgroundColor = .systemGreen
        
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ListTVC.self, forCellReuseIdentifier: ListTVC.identifier)
        
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionFooterHeight = 0

    }

}

extension TableTestVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "오픈리스트 광고" : "울트라콜 광고"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 22
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTVC", for: indexPath) as? ListTVC else { return UITableViewCell() }
        
        cell.storeNameLabel.text = "할머니 보고싶어여"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

