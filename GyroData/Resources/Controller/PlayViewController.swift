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
    
    private var viewType: viewType
    
    init(viewType: PlayViewController.viewType) {
        self.viewType = viewType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
