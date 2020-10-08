//
//  MVVMViewController.swift
//  PatternsApp
//
//  Created by mac on 06.10.2020.
//

import UIKit

class MVVMViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

    var viewModel: MVVMViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [ unowned self] viewModel in
                self.nameLabel.text = viewModel.greeting
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let person = Person(name: "Oleg", surname: "Stasiv")
        viewModel = MVVMViewModel(person: person)
    }
    
    @IBAction func buttonTap() {
        viewModel.showGreeting()
    }

}
