//
//  ViewModelMVVMJson.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

protocol ViewModelMVVMJsonProtocol {
    var results: Results? { get }
    func fetchResults(completion: @escaping() -> Void)
    func numberOfRow() -> Int
    func setIndex(at indexPath: IndexPath)
    func cellViewModer(for indexPath: IndexPath) -> CellViewModelMVVMJsonProtocol?
    func viewModelForSelectedRow() -> DetailViewModelMVVMJsonProtocol?
}

class ViewModelMVVMJson: ViewModelMVVMJsonProtocol {

    var results: Results?
    var indexPath: IndexPath?

    func fetchResults(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { (results) in
            self.results = results
            completion()
        }
    }

    func numberOfRow() -> Int {
        results?.clubs.count ?? 0
    }

    func cellViewModer(for indexPath: IndexPath) -> CellViewModelMVVMJsonProtocol? {
        guard let teams = results?.clubs else { return nil }
        return CellViewModelMVVMJson(team: teams[indexPath.row])
    }

    func setIndex(at indexPath: IndexPath) {
        self.indexPath = indexPath
    }

    func viewModelForSelectedRow() -> DetailViewModelMVVMJsonProtocol? {
        guard let indexPath = indexPath, let teams = results?.clubs else { return nil }
        let team = teams[indexPath.row]
        return DetailViewModelMVVMJson(team: team)
    }

}
