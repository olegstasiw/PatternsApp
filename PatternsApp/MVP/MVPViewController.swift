//
//  ViewController.swift
//  PatternsApp
//
//  Created by mac on 02.10.2020.
//

import UIKit

class MVPViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!

    private var presenter: MVPPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Tim", surname: "Cook")
        presenter = MVPPresenter(view: self, person: person)
    }

    @IBAction func tapButtonPress() {
        presenter.showGreeting()
    }

}

extension MVPViewController: MVPViewProtocol {
    func setGreeting(_ greeting: String) {
        textLabel.text = greeting
    }
}

