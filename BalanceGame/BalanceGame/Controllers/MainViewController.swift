////
////  ViewController.swift
////  BalanceGame
////
////  Created by beaunexMacBook on 4/25/24.
////
//
//import UIKit
//import SnapKit
//import RxSwift
//import RxCocoa
//
//final class MainViewController: UIViewController {
//    let disposeBag = DisposeBag()
//    let rootView = MainView()
//    
//    override func loadView() {
//        view = rootView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "💖밸런스 게임💖"
//        print(#function)
//        
//        rootView.startButton.rx.tap.subscribe { _ in
//            print("3")
//          
//            self.navigationController?.pushViewController(CategoryViewController(), animated: true)
//            self.navigationController?.navigationBar.isHidden = true
//        }.disposed(by: disposeBag)
//        
//    }
//}
//
//
