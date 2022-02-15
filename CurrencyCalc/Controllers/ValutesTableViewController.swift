//
//  ValutesTableViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit

protocol SelectValuteTypeDelegate: AnyObject {
    func selectValuteType(didSelect valuteType: Valute)
}

class ValutesTableViewController: UITableViewController {
    
    weak var delegate: SelectValuteTypeDelegate?
    private var valutes = [Valute]()
    var choosenValute: Valute?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchData()
        setUpSearchBar()
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchValute { valutesJSON in
            var undsortedValutes = [Valute]()
            undsortedValutes.append(DataManager.shared.rubble)
            for valute in valutesJSON {
                undsortedValutes.append(valute)
            }
            DispatchQueue.main.async {
                self.valutes = undsortedValutes.sorted { $0.name! < $1.name! }
                self.tableView.reloadData()
            }
        }
    }
    
    private func setUpTableView() {
        tableView.register(ValuteTableViewCell.self, forCellReuseIdentifier: ValuteTableViewCell.cellID)
        tableView.separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        title = "Выберите валюту"
    }
    
    private func setUpSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Найти валюту"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
    }
     
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if valutes.isEmpty {
            return 0
        }else {
            return valutes.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ValuteTableViewCell.cellID, for: indexPath) as! ValuteTableViewCell
        let valute = valutes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = valute.name
        cell.contentConfiguration = content
        
        if valute == choosenValute {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valute = valutes[indexPath.row]
        choosenValute = valute
        delegate?.selectValuteType(didSelect: valute)
        tableView.reloadData()
    }

}

// MARK: - SearchBar Delegate

extension ValutesTableViewController: UISearchBarDelegate  {
    
}
