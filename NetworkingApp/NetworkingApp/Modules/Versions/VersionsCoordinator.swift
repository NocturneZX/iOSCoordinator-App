//
//  VersionsCoordinator.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21. Edited by Julio Reyes on 8/20/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation
import UIKit

class VersionsCoordinator: NSObject, Coordinator {

    enum State {
        case idle
        case loading
        case success
        case failure
    }

    private let versionsService = XcodeVersionsService()
    private var viewController = VersionsViewController()
    
    var viewModel: VersionViewModel = VersionViewModel()
    
    private var state: State = .idle {
        didSet {
            // TODO: fill this in as needed during interview
            switch state {
            case .idle:
                _ = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { timer in
                    self.presentAlert()
                }
            case .loading:
                getVersions()
            case .success:
                viewController.render()
            case .failure:
                viewController.render()
                presentAlert()
            }
        }
    }

    var rootViewController: UIViewController {
        viewController
    }

    func start() {
        // TODO: fill this in as needed during interview, including any desired method params
        viewController.coordinator = self
        state = .loading
    }

}

extension VersionsCoordinator {
    
    // Network call(s)
    func getVersions(){
        versionsService.fetchVersions {[weak self] (Versions) in
            if(Versions.count > 0){
                self?.viewModel.versionModels = Versions
                self?.state = .success
            } else {
                self?.state = .failure
            }
        }
    }
    
    func presentAlert(){
        let alert = UIAlertController(title: "Warning!", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { action in
              switch action.style{
              case .default:
                self.state = .loading
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")

              @unknown default:
                fatalError("Unknown error.")
              }}))
        viewController.present(alert, animated: true, completion: nil)
    }
}

