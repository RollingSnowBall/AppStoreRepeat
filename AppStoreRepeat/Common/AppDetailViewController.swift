//
//  AppDetailViewController.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/20.
//

import UIKit
import SnapKit

class AppDetailViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.setTitle("받기", for: .normal)
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        
        return button
    }()
    
    init(today: Today) {
        let today: Today = today
        
        super.init(nibName: nil, bundle: nil)
        
        setData(title: today.title, description: today.description, imageURL: today.imageURL)
    }
    
    init(feature: Feature) {
        let feature: Feature = feature
        super.init(nibName: nil, bundle: nil)
        
        setData(title: feature.appName, description: feature.description, imageURL: feature.imageURL)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
    }
}

private extension AppDetailViewController {
    
    func setData(title: String, description: String, imageURL: String){
        titleLabel.text = title
        descriptionLabel.text = description
        
        if let imageURL = URL(string: imageURL){
            imageView.kf.setImage(with: imageURL)
        }
        
    }
    
    func setupLayout(){
        [ imageView, titleLabel, descriptionLabel, downloadButton, shareButton ].forEach{
            view.addSubview($0)
        }
        
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(100)
            $0.width.equalTo(imageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints{
            $0.width.equalTo(60)
            $0.height.equalTo(32)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
        }
        
        shareButton.snp.makeConstraints{
            $0.width.equalTo(32)
            $0.height.equalTo(32)
            $0.centerY.equalTo(downloadButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}
