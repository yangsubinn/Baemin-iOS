//
//  categoriesCVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit

class categoriesCVC: UICollectionViewCell {
    static let identifier = "categoriesCVC"
    
    var categoryLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        print("-----------prepareForReuse---------")
    }
    
    //MARK: - Custom Method
    private func configUI() {
        self.backgroundColor = .lightGray
        
        categoryLabel.text = "귀찮다"
        categoryLabel.textColor = .black
        categoryLabel.font = UIFont.systemFont(ofSize: 15)
        
//        print("configUI 실행")
    }
    
    private func setupLayout() {
        addSubview(categoryLabel)
        
        categoryLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
//        print("setupLayout 실행됨")
    }

}
