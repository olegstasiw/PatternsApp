//
//  MVVMJsonTableViewController.swift
//  PatternsApp
//
//  Created by mac on 08.10.2020.
//

import UIKit

class MVVMJsonTableViewController: UITableViewController {

    private var viewModel: ViewModelMVVMJsonProtocol! {
        didSet {
            viewModel.fetchResults {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModelMVVMJson()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MVVMJsonDetailSegue" {
            let segueViewController = segue.destination as! DetailMVVMJsonViewController
            segueViewController.viewModel = sender as? DetailViewModelMVVMJsonProtocol
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRow()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mvvmjsoncell", for: indexPath) as! MVVMJsonTableViewCell
        let cellViewModel = viewModel.cellViewModer(for: indexPath)
        cell.viewModel = cellViewModel
    
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        viewModel.setIndex(at: indexPath)
        let detailViewModel = viewModel.viewModelForSelectedRow()

        performSegue(withIdentifier: "MVVMJsonDetailSegue", sender: detailViewModel)
    }

}
