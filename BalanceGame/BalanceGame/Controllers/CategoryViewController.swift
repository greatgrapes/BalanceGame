//
//  CategoryViewController.swift
//  BalanceGame
//
//  Created by beaunexMacBook on 4/26/24.
//

import UIKit
import SnapKit

final class CategoryViewController: UIViewController {

    private var rootView: CategoryView = CategoryView()
    private var mockData: [MockUpData] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 라벨 생성
        let titleLabel = UILabel()
        titleLabel.text = "💖사랑이랑 밸런스 게임💖"
        titleLabel.font = UIFont(name: "GOSEONGGEUMGANGNURI", size: 17)
        titleLabel.sizeToFit()

        // 타이틀 뷰로 라벨 설정
        navigationItem.titleView = titleLabel
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family), Names: \(names)")
        }
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
        fetchMockDataFromJSON()
     
    }
    
    func setupBackBarButton() {
        let backButton = UIBarButtonItem(title: "💖", style: .plain, target: self, action: nil)
        backButton.tintColor = .white
        self.navigationItem.backBarButtonItem = backButton
    }

    func fetchMockDataFromJSON() {
        guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json") else {
            print("Mock.json file not found")
            return
        }
        print("Found Mock.json at \(url)")  // 파일 위치 출력
        do {
            let data = try Data(contentsOf: url)
            print("Data loaded successfully. Size: \(data.count) bytes")  // 로드된 데이터 크기 출력
            let decodedData = try JSONDecoder().decode([MockUpData].self, from: data)
            // 데이터를 문자열로 변환
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Data loaded successfully:\n\(jsonString)")  // 로드된 데이터 문자열 출력
            }
            DispatchQueue.main.async {
                self.mockData = decodedData
                self.rootView.collectionView.reloadData()
            }
        } catch {
            print("Error reading or decoding JSON: \(error)")
        }
    }
}
    



extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rootView.collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        let data = mockData[indexPath.row]
        cell.setData(imageUrl: data.imageUrl, label: data.text)
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.foodQuestions, title: "음식"), animated: true)
            setupBackBarButton()
        case 1:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.loveQuestions, title: "연애"), animated: true)
            setupBackBarButton()
        case 2:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.situationQuestions, title: "상황"), animated: true)
            setupBackBarButton()
        case 3:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.friendQuestions, title: "친구"), animated: true)
            setupBackBarButton()
            
        case 4:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.officeWorkerQuestions, title: "직장인"), animated: true)
            setupBackBarButton()
            
        case 5:
            self.navigationController?.pushViewController(GameViewController(questions: Questions.polarOppositesQuestions, title: "극과극"), animated: true)
            setupBackBarButton()
        default:
            print("default Case")
        }
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {

}
