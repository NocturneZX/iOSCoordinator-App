//
//  VersionsView.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21. Edited by Julio Reyes on 8/20/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit


class VersionsView: UIView {

    private let spinner = UIActivityIndicatorView(style: .medium)
    private let tableView = UITableView()
    private let textLabel = UILabel()
    weak var viewModel: VersionViewModel!

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTable()
        setupSpinner()
        setupTextLabel()
        setupStyling()
    }

    private func setupTable() {
        addSubviewAndEdgeConstraints(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "VersionCellIdentifier")
    }

    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        addConstraints([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupTextLabel() {
        textLabel.isHidden = false // Added
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        addConstraints([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupStyling() {
        backgroundColor = .white
        spinner.backgroundColor = .clear
        tableView.backgroundColor = .clear
        textLabel.backgroundColor = .clear
    }

}

extension VersionsView {
    func render(viewModel: VersionViewModel) throws {
        // TODO: fill this in as needed during interview, including any desired method params
        self.viewModel = viewModel

        guard self.viewModel.isError == false else {
            self.textLabel.text = self.viewModel.errMessage
            self.spinner.startAnimating()
            self.tableView.isHidden = true
            self.textLabel.isHidden = false
            return
        }
        
        self.tableView.dataSource = viewModel
        self.tableView.delegate = viewModel
        
        
        //Set View Model bindings.
        self.viewModel.reloadTableViewCompletion = { [weak self] in
            print(Thread.isMainThread)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        self.viewModel.loadingStatus = { [weak self]  in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.textLabel.text = "Loading..."
                    self?.spinner.startAnimating()
                    self?.textLabel.isHidden = false
                } else{
                    self?.spinner.stopAnimating()
                    self?.textLabel.isHidden = true
                    self?.spinner.isHidden = true
                }
            }
        }
        
    } // end render()
}
