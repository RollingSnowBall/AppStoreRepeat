//
//  FeatureSectionView.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/18.
//

import UIKit
import SnapKit

class FeatureSectionView: UIView {
    
    private var featureList: [Feature] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        // scrollDirection : 스크롤 방향
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // isPagingEnabled : CollectionView를 페이지화 (스크롤 전체 이동 or Not)
        collectionView.isPagingEnabled = true
        // showsHorizontalScrollIndicator : 스크롤 Indicator 표기여부
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground

        collectionView.register(FeatureSectionViewCell.self, forCellWithReuseIdentifier: "FeatureSectionCollectionViewCell")

        return collectionView
    }()
    
    private let seperatorView = SeperatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        featureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeatureSectionCollectionViewCell", for: indexPath) as? FeatureSectionViewCell else { return UICollectionViewCell() }
        
        let feature = featureList[indexPath.item]
        
        cell.setup(feature: feature)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let feature = featureList[indexPath.item]
        //let viewController = UITapGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
    }
}

extension FeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        CGSize(width: collectionView.frame.width - 32, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        32
    }
}

extension FeatureSectionView: UICollectionViewDelegate {
        
}

private extension FeatureSectionView {
    func setUpView(){
        [ collectionView, seperatorView ].forEach{
            addSubview($0)
        }
        
        collectionView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
            $0.bottom.equalToSuperview()
        }
        
        seperatorView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    func fetchData(){
        guard let url = Bundle.main.url(forResource: "Feature", withExtension: "plist") else { return }
                
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Feature].self, from: data)
            
            featureList = result
        }
        catch{
            
        }
    }
}
