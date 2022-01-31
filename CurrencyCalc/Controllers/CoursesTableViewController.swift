//
//  CoursesTableViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    
    // MARK: Private Methods
    private func setUpTableView() {
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .gray
        tableView.separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.backgroundColor = .white
        tableView.register(CourseTableViewCell.self as AnyClass, forCellReuseIdentifier: "Cell")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseTableViewCell
        cell.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
