//
//  ListCVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit

import SnapKit

class ListCVC: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "ListCVC"
    static let SUBVIEW_TAG: Int = 1000
    
    var tableView = UITableView(frame: .zero, style: .grouped)
//    let cellIdentifier: String = "tableCell"
    
    //MARK: - Properties
    let listLabel = UILabel()
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        configUI()
        setupTableView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - Custom Method
    private func configUI() {
        self.backgroundColor = .lightGray
        
//        listLabel.text = "귀찮다"
//        listLabel.textColor = .black
    }
    
    private func setupLayout() {
        addSubview(listLabel)
        addSubview(tableView)
        
        listLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ListTVC.self, forCellReuseIdentifier: ListTVC.identifier)
        
        tableView.setupTableViewNib(nib: ListTVC.identifier)
        
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionFooterHeight = 0

    }
    
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier, for: indexPath) as? ListTVC else {
            return UITableViewCell()
        }
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier, for: indexPath)
//        print("-------------------")
//        print(ListTVC.identifier)
//        print("-------------------")
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: ListTVC.self, for: indexPath)
        
//        cell.backgroundColor = .purple
//        cell.tvcLabel.text
//        cell.textLabel?.text = "잘못된거야"
        cell.tvcLabel.text = "핳머니 손칼국수"
        cell.storeImage.backgroundColor = .yellow
//        cell.backgroundColor = .green
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)->CGFloat {
//          return UITableView.automaticDimension
        return 80
       }

}

extension UITableView {
    func setupTableViewNib(nib: String) {
        let customNib = UINib(nibName: nib, bundle: nil)
        self.register(customNib, forCellReuseIdentifier: nib)
    }
}
