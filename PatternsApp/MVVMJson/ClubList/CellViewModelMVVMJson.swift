//
//  CellViewModelMVVMJson.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

protocol CellViewModelMVVMJsonProtocol {
    var name: String { get }
    var country: String { get }
    var code: String { get }
    init(team: Team)
}

class CellViewModelMVVMJson: CellViewModelMVVMJsonProtocol {
    private var team: Team

    required init(team: Team) {
        self.team = team
    }

    var name: String {
        team.name
    }

    var country: String {
        team.country
    }

    var code: String {
        team.code
    }
}
