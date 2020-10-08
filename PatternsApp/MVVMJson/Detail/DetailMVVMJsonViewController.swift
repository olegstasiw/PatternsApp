//
//  DetailMVVMJsonViewController.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import UIKit

class DetailMVVMJsonViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var smileButton: UIButton!

    @IBOutlet weak var image: UIImageView!

    //BINDING
    var isSmile: Bool = false
    
    var viewModel: DetailViewModelMVVMJsonProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewModelDidChange = { [unowned self] viewModel in
            isSmile = viewModel.isSmile
        }
        viewModel.setSmileStatus()

        likeButton.tintColor = viewModel.isFavorite ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        smileButton.tintColor = isSmile ? #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        nameLabel.text = viewModel.teamName
        codeLabel.text = viewModel.teamCode
        countryLabel.text = viewModel.teamCountry
        guard let data = viewModel.imageData else { return }
        image.image = UIImage(data: data)



    }

    @IBAction func likeButtonPress() {
        viewModel.isFavorite.toggle()
        likeButton.tintColor = viewModel.isFavorite ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

    @IBAction func smileButtonPress() {
        viewModel.changeSmileStatus()
        smileButton.tintColor = isSmile ? #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
