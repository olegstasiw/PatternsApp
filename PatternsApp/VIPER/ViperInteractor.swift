//
//  ViperInteractor.swift
//  PatternsApp
//
//  Created by mac on 16.10.2020.
//

import Foundation

//MARK: - InteractorInput
protocol ViperGreetingProvider {
    func provideGreetingData()
    init(presentor: ViperGreetingOutput)
}

//MARK: - InteractorOutput
protocol ViperGreetingOutput: class {
    func receiveGreetingData(greetingData: GreetingData)
}

class ViperGreetingInteractor: ViperGreetingProvider {

    unowned var presentor: ViperGreetingOutput

    func provideGreetingData() {
        let person = Person(name: "Tim", surname: "Cook")
        let fullName = "\(person.name) \(person.surname)"
        let greetingData = GreetingData(greeting: "Hello", fullName: fullName)
        presentor.receiveGreetingData(greetingData: greetingData)
    }

    required init(presentor: ViperGreetingOutput) {
        self.presentor = presentor
    }
}
