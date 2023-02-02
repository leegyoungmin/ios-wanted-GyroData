//
//  PlayViewController.swift
//  GyroData
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

final class PlayViewController: UIViewController {
    enum viewType {
        case play
        case view
    }
    
    private let viewType: viewType
    private let metaData: TransitionMetaData
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(viewType: PlayViewController.viewType, metaData: TransitionMetaData) {
        self.viewType = viewType
        self.metaData = metaData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

extension PlayViewController {
    func configureUI() {
        view.backgroundColor = .systemBackground
        setNavigationBar()
        addChildComponents()
        setComponentsValues()
        setUpLayout()
    }
    
    func addChildComponents() {
        [
            dateLabel,
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        additionalSafeAreaInsets.left += 16
        additionalSafeAreaInsets.right += 16
        additionalSafeAreaInsets.top += 16
        additionalSafeAreaInsets.bottom += 16
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func setComponentsValues() {
        dateLabel.text = metaData.saveDate
    }
    
    func setNavigationBar() {
        navigationItem.title = "다시보기"
    }
}
