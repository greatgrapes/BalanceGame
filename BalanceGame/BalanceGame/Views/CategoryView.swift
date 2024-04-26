//
//  CategoryView.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import UIKit
import SnapKit

final class CategoryView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let screenWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 5
        let cellWidth = (screenWidth - spacing * 3) / 2

        layout.itemSize = CGSize(width: cellWidth, height: 200)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 10, left: spacing, bottom: 10, right: spacing)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemBackground
        collection.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.id)
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
        self.addSubview(collectionView)
    }
    
    private func layout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
