//
//  XcodeVersion.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21. Edited by Julio Reyes on 8/20/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation
typealias Versions = [XcodeVersion]

struct XcodeVersion: Decodable {
    struct Version: Decodable {
        let number: String
        let build: String
    }

    struct Date: Decodable {
        let year: Int
        let month: Int
        let day: Int
    }

    let version: Version
    let date: Date
}
