//
//  ViperPresenter.swift
//  PatternsApp
//
//  Created by mac on 16.10.2020.
//

import Foundation

struct GreetingData {
    let greeting: String
    let fullName: String
}

//MARK: - ViewOutput
protocol ViperGreetingViewEventHandler {
    func didTapShowGreetingButton()
    init(view: ViperGreetingView)
}

class ViperGreetingPresentor: ViperGreetingViewEventHandler {

    unowned var view: ViperGreetingView

    var interacter: ViperGreetingProvider!

    func didTapShowGreetingButton() {
        interacter.provideGreetingData()
    }

    required init(view: ViperGreetingView) {
        self.view = view
    }
}

extension ViperGreetingPresentor: ViperGreetingOutput {
    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = greetingData.greeting + " " + greetingData.fullName
        view.setGreeting(greeting: greeting)
    }
}
