//
//  ListCVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit

import SnapKit

class ListCVC: UICollectionViewCell {
    static let identifier = "ListCVC"
    static let SUBVIEW_TAG: Int = 1000
    
    //MARK: - Properties
    let listLabel = UILabel()
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        configUI()
//        print("이거 아예 실행 안되는건가?")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - Custom Method
    private func configUI() {
        self.backgroundColor = .lightGray
        
        listLabel.text = "귀찮다"
        listLabel.textColor = .black
//        print("configUI 실행")
    }
    
    private func setupLayout() {
        addSubview(listLabel)
        
        listLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
//        print("setupLayout 실행됨")
    }

}
