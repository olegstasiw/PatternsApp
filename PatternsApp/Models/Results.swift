//
//  Results.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//
struct Results: Decodable {
    let name: String
    let clubs: [Team]
}

struct Team: Decodable {
    let name: String
    let code: String
    let country: String
}
