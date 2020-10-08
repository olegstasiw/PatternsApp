//
//  MVVMViewModel.swift
//  PatternsApp
//
//  Created by mac on 06.10.2020.
//

import Foundation

protocol MVVMViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((MVVMViewModelProtocol) -> Void)? { get set }
    init(person: Person)
    func showGreeting()
}

class MVVMViewModel: MVVMViewModelProtocol {

    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }

    private var person: Person

    var greetingDidChange: ((MVVMViewModelProtocol) -> Void)?

    required init(person: Person) {
        self.person = person
    }

    func showGreeting() {
        greeting = "Hello" + " " + person.name + " " + person.surname
    }


}
