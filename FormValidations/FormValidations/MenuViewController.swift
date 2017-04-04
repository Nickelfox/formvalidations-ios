//
//  MenuViewController.swift
//  FormValidations
//
//  Created by Nickelfox on 04/04/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var cellId = "menuCell"
    var nibId = "MenuViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        displayView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.reloadData()
    }
    
    func displayView() {
        let menuView = Bundle.main.loadNibNamed(nibId, owner: self, options: nil)?.first as! UIView
        self.view = menuView
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = textForCell(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        handleRowSelected(at: indexPath)
    }
    
    //MARK: Helper Methods
    
    func textForCell(at indexPath: IndexPath) -> String{
        var text: String = ""
        switch indexPath.row {
        case 0:
            text = "Validation Field"
        case 1:
            text = "Connect"
        default:
            break
        }
      return text
    }
    
    func handleRowSelected(at indexPath: IndexPath) {
        switch indexPath.row {
        case 0: //Validation Field
            showValidationFieldDemo()
        case 1: // Connect
            showConnectDemo()
        default:
            break
        }
    }
    
    func showValidationFieldDemo() {
        let validationFieldVC = ValidationFieldDemoViewController()
        navigationController?.pushViewController(validationFieldVC, animated: true)
    }
    
    func showConnectDemo() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let connectVC = storyboard.instantiateInitialViewController()
        navigationController?.present(connectVC!, animated: true, completion: nil)
        
    }
    
}
