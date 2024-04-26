//
//  GameCell.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import UIKit
import SnapKit


final class GameCell: UICollectionViewCell {
    
    static let id = "GameCell"
    

     var questionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
         view.layer.borderColor = UIColor.mainColor.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 30

        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
     var questionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "GOSEONGGEUMGANGNURI", size: 20)
        label.textColor = .black
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
        self.addSubview(questionView)
        questionView.addSubview(questionLabel)
    }
    
    private func layout() {
        questionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200) // 이미지 크기를 지정해줍니다.
        }
        
        questionLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    
    func setData(question: String) {
        self.questionLabel.text = question
    }
    
}
