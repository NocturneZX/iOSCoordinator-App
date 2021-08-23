//
//  VersionsViewController.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsViewController: UIViewController {

    private let versionsView = VersionsView()
    weak var coordinator: VersionsCoordinator!
    
    override func loadView() {
        view = versionsView
    }

}

extension VersionsViewController {
    func render() {
        // TODO: fill this in as needed during interview, including any desired method params
        try! versionsView.render(viewModel: coordinator.viewModel)
    }

}

