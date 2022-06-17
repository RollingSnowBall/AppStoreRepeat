//
//  TodayCollectionViewCell.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/17.
//

import UIKit
import SnapKit

class TodayCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    func setup(){
        setLayout()
        
        titleLabel.text = "제목"
        subtitleLabel.text = "부제목"
        descriptionLabel.text = "설명을 해야한다."
    }
}

private extension TodayCollectionViewCell {
    
    func setLayout(){
        [ imageView, titleLabel, subtitleLabel, descriptionLabel].forEach{
            addSubview($0)
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(subtitleLabel.snp.leading)
            $0.trailing.equalTo(subtitleLabel.snp.trailing)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
