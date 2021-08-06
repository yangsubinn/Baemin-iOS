//
//  ListTVC.swift
//  Baemin
//
//  Created by 양수빈 on 2021/08/06.
//

import UIKit

class ListTVC: UITableViewCell {
    
    static let identifier = "ListTVC"
    
    var tvcLabel = UILabel()
    var storeImage = UIImageView()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Custom Method
    private func configUI() {
        self.backgroundColor = .blue
        
        tvcLabel.text = "귀찮다"
        tvcLabel.textColor = .black
        tvcLabel.font = UIFont.systemFont(ofSize: 15)
        
        storeImage.backgroundColor = .gray
        
//        print("configUI 실행")
    }
    
    private func setupLayout() {
        addSubview(tvcLabel)
        addSubview(storeImage)
        
        tvcLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        storeImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(68)
        }
    
    }
}
