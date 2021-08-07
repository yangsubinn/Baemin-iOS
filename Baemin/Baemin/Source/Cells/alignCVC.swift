//
//  alignCVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/01.
//

import UIKit

class alignCVC: UICollectionViewCell {
    static let identifier = "alignCVC"

    //MARK: - Properties
    var alignLabel = UILabel()
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
        setupLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK: - Custom Method
    private func configUI() {
        self.backgroundColor = .lightGray
        
        alignLabel.text = "귀찮다"
        alignLabel.textColor = .black
        alignLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func setupLayout() {
        addSubview(alignLabel)
        
        alignLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
