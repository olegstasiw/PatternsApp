//
//  ViperViewController.swift
//  PatternsApp
//
//  Created by mac on 16.10.2020.
//

import UIKit

//MARK: - ViewInput
protocol ViperGreetingView: class {
    func setGreeting(greeting: String)
}

class ViperViewController: UIViewController, ViperGreetingView {

    @IBOutlet weak var textLabel: UILabel!
    
    var presenter: ViperGreetingViewEventHandler!
    private var configurator: ViperGreetingConfiguratorProtocol = ViperGreetingConfigurator()

    func setGreeting(greeting: String) {
        textLabel.text = greeting
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        presenter.didTapShowGreetingButton()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
