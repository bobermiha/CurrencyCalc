//
//  CoursesTableViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    // MARK: Private Properties
    
    private var valutes: [Valute] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchValute()
    }
    
    
    // MARK: Private Methods
    
    private func setUpTableView() {
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .gray
        tableView.separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.backgroundColor = .white
        tableView.register(CourseTableViewCell.self as AnyClass, forCellReuseIdentifier: "Cell")
    }
    
    private func fetchValute() { // network method
        NetworkManager.shared.fetchValute { (data) in
            var valutes = [Valute]()
            for item in data {
                valutes.append(item)
            }
            let sortedArray = valutes.sorted {$0.name! < $1.name!}
            self.valutes = sortedArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valutes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseTableViewCell
        let item = valutes[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
