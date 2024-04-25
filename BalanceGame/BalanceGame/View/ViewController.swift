//
//  ViewController.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/25/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    private lazy var buttonStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    private lazy var startButton: UIButton = buttonBuilder(title: "시작")
    private lazy var resultButton: UIButton = buttonBuilder(title: "결과")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BALANCE GAME"
        print(#function)
        setupUI()
        setupAutolayout()
        
        startButton.rx.tap.subscribe { _ in
            print("3")
        }.disposed(by: disposeBag)
        
    }
    
    private func setupUI() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(startButton)
        buttonStackView.addArrangedSubview(resultButton)
    }
    
    private func setupAutolayout() {
        buttonStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        startButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        resultButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
    }
    
    private func buttonBuilder(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 10
        button.layer.cornerRadius = 30

        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.layer.masksToBounds = false
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 20
        button.layer.shadowOpacity = 0.3
        return button
    }


}


