//
//  RankingSectionViewCell.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/19.
//

import UIKit
import SnapKit

class RankingSectionViewCell: UICollectionViewCell {
    
    static var cellHeight: CGFloat { 70 }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var inAppPurchaseLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .secondaryLabel
        label.text = "앱 내 구입"
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.cornerRadius = 12
        
        return button
    }()
    
    
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 7
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        
        return imageView
    }()
    
    func setup(ranking: RankingFeature){
        setLayout()
        
        titleLabel.text = ranking.title
        descriptionLabel.text = ranking.description
        inAppPurchaseLabel.isHidden = ranking.isInPurchaseApp
    }
}

private extension RankingSectionViewCell {
    func setLayout(){
        [imageView, titleLabel, descriptionLabel, downloadButton, inAppPurchaseLabel].forEach{
            addSubview($0)
        }
        
        imageView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.equalToSuperview()
            $0.width.equalTo(imageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.top.equalTo(imageView.snp.top).inset(8)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(50)
            $0.height.equalTo(24)
        }
        
        inAppPurchaseLabel.snp.makeConstraints{
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
        }
    }
}
