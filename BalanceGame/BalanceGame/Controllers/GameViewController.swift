////
////  BalanceGameViewController.swift
////  BalanceGame
////
////  Created by beaunexMacBook on 4/26/24.
////
//
import UIKit
import SnapKit
import RxSwift
import RxCocoa


final class GameViewController: UIViewController  {
    var questions: [String]
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "GOSEONGGEUMGANGNURI", size: 17)
        label.sizeToFit()
        return label
    }()
    
    
    init(questions: [String], title: String) {
        self.questions = questions
        self.titleLabel.text = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var currentRoundQuestions: [String] = []
    var currentRoundIndex = 0
    var selectedQuestions: [String] = []
    
    let rootView = GameView()

    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 타이틀 뷰로 라벨 설정
        navigationItem.titleView = titleLabel
        rootView.collectionView.register(GameCell.self, forCellWithReuseIdentifier: GameCell.id)
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        setupInitialRound()
        updateTitle() // 제목 업데이트 메서드 호출
    }
    
    // 라운드 설정 메서드
    func setupInitialRound() {
        questions.shuffle() // 문제 배열을 섞습니다.
        currentRoundQuestions = Array(questions.prefix(2)) // 처음 두 문제를 선택
        currentRoundIndex = 0
        rootView.collectionView.reloadData()
    }
    
    // 제목 업데이트 메서드
    private func updateTitle() {
        rootView.titleLabel.text = "\(questions.count)강"
    }
    

    
}

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentRoundQuestions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rootView.collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.id, for: indexPath) as? GameCell else { return UICollectionViewCell() }
        cell.setData(question: currentRoundQuestions[indexPath.item])
        return cell
    }
}


extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedQuestion = currentRoundQuestions[indexPath.item]
        selectedQuestions.append(selectedQuestion)

        // 현재 라운드의 마지막 문제가 선택되었는지 확인
        if currentRoundQuestions.count * (currentRoundIndex + 1) >= questions.count {
            // 선택된 문제들로 다음 라운드 준비
            if selectedQuestions.count > 1 {
                questions = selectedQuestions // 선택된 문제들로 문제 배열 갱신
                selectedQuestions = []
                currentRoundIndex = 0
                currentRoundQuestions = Array(questions.prefix(2)) // 새로운 라운드의 첫 두 문제 선택
                rootView.titleLabel.text = "\(questions.count)강"
            } else {
                // 최종 우승 문제 처리
                currentRoundQuestions = [selectedQuestions.first!] // 최종 문제를 배열에 저장
                print("최종: \(selectedQuestions.first!)")
                rootView.titleLabel.text = "✨우승ㅎㅅㅎ✨"
                rootView.collectionView.reloadData()
            }
            rootView.collectionView.reloadData()
        } else {
            // 현재 라운드의 다음 문제들 준비
            if rootView.titleLabel.text == "✨우승ㅎㅅㅎ✨" {
                print("야호")
            } else {
                currentRoundIndex += 1
                currentRoundQuestions = Array(questions[(currentRoundIndex * 2)..<(currentRoundIndex * 2 + 2)])
                rootView.collectionView.reloadData()
            }
        }
    }
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = width
        let cellHeight: CGFloat = 250
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
