//
//  PlayViewController.swift
//  GyroData
//
//  Copyright (c) 2023 Minii All rights reserved.

import UIKit

final class PlayViewController: UIViewController {
    enum viewType: String {
        case play = "Play"
        case view = "View"
    }
    
    private let viewType: viewType
    private let metaData: TransitionMetaData
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let viewTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(for: .largeTitle, weight: .bold)
        return label
    }()
    
    private let controlButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play"), for: .normal)
        return button
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
            viewTypeLabel
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
            dateLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            viewTypeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            viewTypeLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            viewTypeLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func setComponentsValues() {
        dateLabel.text = metaData.saveDate
        viewTypeLabel.text = self.viewType.rawValue
    }
    
    func setNavigationBar() {
        navigationItem.title = "다시보기"
    }
}
