//
//  NetworkManager.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    private let resultsURL = "https://raw.githubusercontent.com/openfootball/football.json/master/2019-20/en.1.clubs.json"

    private init() {}

    func fetchData(completion: @escaping(Results) -> Void) {
        guard let url = URL(string: resultsURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Results.self, from: data)
                completion(results)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
