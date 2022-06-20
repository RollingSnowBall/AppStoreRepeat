//
//  ExchangeSectionView.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/20.
//

import UIKit
import SnapKit

class ExchangeSectionView: UIView {
    
    private lazy var ExchangeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("코드 교환", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 7
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ExchangeSectionView {
    func setupLayout(){
        [ ExchangeButton ].forEach{ addSubview($0) }
        
        ExchangeButton.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
