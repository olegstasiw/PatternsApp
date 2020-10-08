//
//  DetailViewModelMVVMJson.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

protocol DetailViewModelMVVMJsonProtocol {
    var teamName: String { get }
    var teamCode: String { get }
    var teamCountry: String { get }
    var imageData: Data? { get }
    var isFavorite: Bool { get set }
    var isSmile: Bool { get }
    var viewModelDidChange: ((DetailViewModelMVVMJsonProtocol) -> Void)? { get set }
    init(team: Team)
    func setSmileStatus()
    func changeSmileStatus()
}

class DetailViewModelMVVMJson: DetailViewModelMVVMJsonProtocol {
    var isFavorite: Bool {
        get {
            DataManager.shared.loadFavoriteStatus(for: team.name)
        }
        set {
            DataManager.shared.saveFavoriteStatus(for: team.name, with: newValue)
        }
    }

    var isSmile: Bool {
        didSet {
            viewModelDidChange?(self)
        }
    }

    var viewModelDidChange: ((DetailViewModelMVVMJsonProtocol) -> Void)?
    
    var imageData: Data? {
        ImageManager.shared.getImageData(from: "https://img.pngio.com/epl-2016-17-dream-league-soccer-2016-logos-kuchalana-dream-league-soccer-2016-logos-320_320.jpg")
    }

    var teamCode: String {
        team.code
    }

    var teamCountry: String {
        team.country
    }

    var teamName: String {
        team.name
    }

    private let team: Team
    required init(team: Team) {
        self.team = team
        isSmile = false
    }

    func setSmileStatus() {
        isSmile = DataManager.shared.loadFavoriteStatus(for: team.code)
    }

    func changeSmileStatus() {
        isSmile.toggle()
        DataManager.shared.saveFavoriteStatus(for: team.code, with: isSmile)
    }
}

