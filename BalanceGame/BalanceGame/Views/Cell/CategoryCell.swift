//
//  CategoryCell.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import UIKit
import SnapKit
import Kingfisher

final class CategoryCell: UICollectionViewCell {
    
    static let id = "CategoryCell"
    
    private var networkImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private var networkLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "GOSEONGGEUMGANGNURI", size: 17)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(networkImageView)
        self.addSubview(networkLabel)
    }
    
    private func layout() {
        networkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150) 
        }
        
        networkLabel.snp.makeConstraints { make in
            make.top.equalTo(networkImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func setData(imageUrl: String, label: String) {
        self.networkImageView.kf.setImage(with: URL(string: imageUrl))
        self.networkLabel.text = label
    }
    
}
