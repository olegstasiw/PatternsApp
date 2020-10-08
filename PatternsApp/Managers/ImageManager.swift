//
//  ImageManager.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()

    private init() {}

    func getImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
