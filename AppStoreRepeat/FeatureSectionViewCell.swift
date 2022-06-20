//
//  FeatureSectionViewCell.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/18.
//

import UIKit
import SnapKit

class FeatureSectionViewCell: UICollectionViewCell {
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 7
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.backgroundColor = .blue
        
        // clipsToBounds : 하위 뷰가 해당 이미지 테두리에 맞게 설정됨
        imageView.clipsToBounds = true
        // contentMode : imageView에 이미지를 넣을때 이미지 비율
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    func setup(feature: Feature){
        setSubview()
        
        typeLabel.text = feature.type
        titleLabel.text = feature.appName
        subtitleLabel.text = feature.description
        
        if let imageURL = URL(string: feature.imageURL){
            imageView.kf.setImage(with: imageURL)
        }
    }
}

private extension FeatureSectionViewCell {
    
    func setSubview(){
        [ imageView, typeLabel, titleLabel, subtitleLabel].forEach{
            addSubview($0)
        }
        
        typeLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(typeLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
