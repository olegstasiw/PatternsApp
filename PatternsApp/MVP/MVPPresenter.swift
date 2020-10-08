//
//  MVPPresenter.swift
//  PatternsApp
//
//  Created by mac on 02.10.2020.
//

import Foundation

protocol MVPViewProtocol: class {
    func setGreeting(_ greeting: String)
}

protocol MVPPresenterProtocol {
    func showGreeting()
    init(view: MVPViewProtocol, person: Person)
}

class MVPPresenter: MVPPresenterProtocol {

    unowned let view: MVPViewProtocol
    let person: Person

    func showGreeting() {
        let greeting = "Hello" + " " + person.name + " " + person.surname
        view.setGreeting(greeting)
    }

    required init(view: MVPViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }


}

