//
//  AppViewController.swift
//  AppStoreRepeat
//
//  Created by JUNO on 2022/06/17.
//

import UIKit
import SnapKit

class AppViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let RankingSectionView = RankingSectionView(frame: .zero)
        let ExchangeSectionView = ExchangeSectionView(frame: .zero)
        
        let spacing = UIView()
        spacing.snp.makeConstraints{
            $0.height.equalTo(70)
        }
        
        [ featureSectionView,
          RankingSectionView,
          ExchangeSectionView,
          spacing ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        setLayout()
    }
}

private extension AppViewController {
    func setNavigation(){
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setLayout(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
