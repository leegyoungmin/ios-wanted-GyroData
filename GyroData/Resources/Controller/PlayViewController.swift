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
        view.backgroundColor = .systemBackground
    }
}
