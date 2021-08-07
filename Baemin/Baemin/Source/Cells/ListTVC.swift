//
//  ListTVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/07.
//

import UIKit

import SnapKit

class ListTVC: UITableViewCell {
    static let identifier = "ListTVC"
    
    //MARK: - Properties
    var storeNameLabel = UILabel()
    var storeImage = UIImageView()
    var starLabel = UILabel()
    var countLabel = UILabel()
    var menuLabel = UILabel()
    var clockLabel = UILabel()
    var leastPayLabel = UILabel()
    var tipLabel = UILabel()
    
    let starImage = UIImageView()
    let clockImage = UIImageView()

    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        configUI()
        setupLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //MARK: - Custom Method
    private func configUI() {
        storeImage.backgroundColor = .gray
        storeImage.layer.cornerRadius = 20
        
        storeNameLabel.text = "가게이름"
        starLabel.text = "4.5"
        countLabel.text = "(100+)"
        menuLabel.text = "대표메뉴1, 2, 3, 4, 5, 6 ..."
        clockLabel.text = "25~44분,"
        leastPayLabel.text = "최소주문 5,000원"
        tipLabel.text = "배달팁 2,500원"
        
        starImage.image = UIImage(named: "Star")
        clockImage.image = UIImage(named: "clock")
        
        storeNameLabel.font = .boldSystemFont(ofSize: 17)
        starLabel.font = .boldSystemFont(ofSize: 13)
        countLabel.font = .systemFont(ofSize: 13)
        menuLabel.font = .systemFont(ofSize: 13)
        clockLabel.font = .systemFont(ofSize: 13)
        leastPayLabel.font = .systemFont(ofSize: 13)
        tipLabel.font = .systemFont(ofSize: 13)
    }
    
    private func setupLayout() {
        addSubviews([storeImage, storeNameLabel, starImage, starLabel, countLabel, menuLabel, clockImage, clockLabel, leastPayLabel, tipLabel])
        
        storeImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(12)
            make.width.height.equalTo(68)
        }
        
        storeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(storeImage.snp.trailing).offset(12)
        }
        
        starImage.snp.makeConstraints { make in
            make.top.equalTo(storeNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(storeImage.snp.trailing).offset(12)
            make.width.height.equalTo(12)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage.snp.centerY)
            make.leading.equalTo(starImage.snp.trailing).offset(3)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage.snp.centerY)
            make.leading.equalTo(starLabel.snp.trailing).offset(2)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImage.snp.centerY)
            make.leading.equalTo(countLabel.snp.trailing).offset(6)
        }
        
        clockImage.snp.makeConstraints { make in
            make.top.equalTo(starImage.snp.bottom).offset(10)
            make.leading.equalTo(storeImage.snp.trailing).offset(12)
            make.width.height.equalTo(11)
        }
        
        clockLabel.snp.makeConstraints { make in
            make.centerY.equalTo(clockImage.snp.centerY)
            make.leading.equalTo(clockImage.snp.trailing).offset(3)
        }
        
        leastPayLabel.snp.makeConstraints { make in
            make.centerY.equalTo(clockImage.snp.centerY)
            make.leading.equalTo(clockLabel.snp.trailing).offset(3)
        }
        
        tipLabel.snp.makeConstraints { make in
            make.top.equalTo(clockImage.snp.bottom).offset(8)
            make.leading.equalTo(storeImage.snp.trailing).offset(12)
        }
    
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
