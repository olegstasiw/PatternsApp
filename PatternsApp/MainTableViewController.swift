//
//  MainTableViewController.swift
//  PatternsApp
//
//  Created by mac on 02.10.2020.
//

import UIKit

class MainTableViewController: UITableViewController {

    let patterns = ["MVP", "MVVM", "MVVMJson"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patterns.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let pattern = patterns[indexPath.row]
        cell.textLabel?.text = pattern
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "MVPSegue", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "MVVMSegue", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "MVVMJsonSegue", sender: nil)
        }
    }

}
