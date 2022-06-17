//
//  TodayCollectionViewHeader.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/17.
//

import UIKit
import SnapKit

class TodayCollectionViewHeader: UICollectionReusableView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()

        label.font = .systemFont(ofSize: 14, weight: .black)
        label.textColor = .secondaryLabel
        label.text = "6월 28일 월요일"
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .black)
        label.textColor = .label
        label.text = "투데이"
        
        return label
    }()
    
    func setup(){
        [dateLabel, titleLabel].forEach{
            addSubview($0)
        }
        
        dateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(dateLabel.snp.leading)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
    }
}
