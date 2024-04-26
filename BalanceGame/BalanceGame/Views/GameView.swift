//
//  GameView.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import UIKit
import SnapKit


final class GameView: UIView {

    var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 5
        
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.3
        return view
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "32강"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 150)  // 셀 크기 설정
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)  // 섹션의 여백
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground  // 배경색 설정
        return collection
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
        self.backgroundColor = .systemBackground
        self.addSubview(titleView)
        titleView.addSubview(titleLabel)
        self.addSubview(collectionView)
    }
    
    private func layout() {
        titleView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
