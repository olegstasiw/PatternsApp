//
//  MVVMJsonTableViewCell.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import UIKit

class MVVMJsonTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    
    var viewModel: CellViewModelMVVMJsonProtocol! {
        didSet {
            countryLabel.text = viewModel.country
            teamNameLabel.text = viewModel.name
            codeLabel.text = viewModel.code
        }
    }

}
