//
//  ViperConfigurator.swift
//  PatternsApp
//
//  Created by mac on 16.10.2020.
//

import Foundation

protocol ViperGreetingConfiguratorProtocol {
    func configure(with view: ViperViewController)
}

class ViperGreetingConfigurator: ViperGreetingConfiguratorProtocol {
    func configure(with view: ViperViewController) {
        let presenter = ViperGreetingPresentor(view: view)
        let interactor = ViperGreetingInteractor(presentor: presenter)

        view.presenter = presenter
        presenter.interacter = interactor
    }
}
