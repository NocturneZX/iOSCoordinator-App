//
//  VersionsViewModel.swift
//  NetworkingApp
//
//  Created by Julio Reyes on 8/20/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation
import UIKit

typealias completion = () -> ()
class VersionViewModel: NSObject {
    var versionModels: Versions? = nil {
        didSet{
            self.reloadTableViewCompletion?()
        }
    }
    
    // Check if the API Service is making a network call
    var isLoading: Bool = false {
        didSet{
            self.loadingStatus?()
        }
    }
    
    var errMessage: String = "Downloading versions of XCode has failed."
    var isError: Bool {
        get {
            if versionModels != nil && versionModels!.isEmpty {
                return true
            }
            return false
        }
    }
    
    var reloadTableViewCompletion: (completion)?
    var loadingStatus: (completion)?
    
    
    override init() {
        super.init()
    }
}

extension VersionViewModel {
    func getVersion(at indexPath: IndexPath) -> XcodeVersion {
        return versionModels![indexPath.row]
    }
}

extension VersionViewModel: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.versionModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VersionCellIdentifier", for: indexPath)
        let cellSearchResult = self.getVersion(at: indexPath)
        cell.textLabel?.text = "Version: \(cellSearchResult.version.number) Build: \(cellSearchResult.version.build)"
        cell.detailTextLabel?.text = "Date: \(cellSearchResult.date.day)/\(cellSearchResult.date.month)/\(cellSearchResult.date.year)"
        return cell
    }
    
}
