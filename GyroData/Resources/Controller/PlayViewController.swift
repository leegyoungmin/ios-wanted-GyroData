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
    
    private let playType: viewType
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
        
        let configure = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 40), scale: .large)

        let playImage = UIImage(systemName: "play.fill", withConfiguration: configure)
        button.setImage(playImage, for: .normal)
        
        let pauseImage = UIImage(systemName: "pause.fill", withConfiguration: configure)
        button.setImage(pauseImage, for: .selected)
        
        return button
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        return label
    }()
    
    init(viewType: PlayViewController.viewType, metaData: TransitionMetaData) {
        self.playType = viewType
        self.metaData = metaData
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setButtonActions()
    }
}

extension PlayViewController {
    func setButtonActions() {
        controlButton.addTarget(
            self,
            action: #selector(didTapControlButton),
            for: .touchUpInside
        )
    }
}

extension PlayViewController {
    @objc func didTapControlButton() {
        controlButton.isSelected.toggle()
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
        
        if playType == .play {
            [
                controlButton,
                timeLabel
            ].forEach {
                view.addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
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
        
        if playType == .play {
            setControlLayout()
        }
    }
    
    func setControlLayout() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            controlButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            controlButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -120),
            timeLabel.centerYAnchor.constraint(equalTo: controlButton.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: controlButton.trailingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    func setComponentsValues() {
        dateLabel.text = metaData.saveDate
        viewTypeLabel.text = self.playType.rawValue
        
        if playType == .play {
            timeLabel.text = metaData.recordTime.description
        }
    }
    
    func setNavigationBar() {
        navigationItem.title = "다시보기"
    }
}
