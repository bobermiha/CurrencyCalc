//
//  CoursesTableViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit
import Alamofire

class CoursesTableViewController: UITableViewController {
    
    var valutes: [Valute] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .gray
        tableView.separatorInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.backgroundColor = .white
        tableView.register(CourseTableViewCell.self as AnyClass, forCellReuseIdentifier: "Cell")
        fetchData()
        print(valutes)
    }

    func fetchData() {
        AF.request("https://www.cbr-xml-daily.ru/daily_json.js").validate(statusCode: 200..<300).responseDecodable(of: ValuteData.self) { response in
            guard let valuteData = response.value else {return}
            if let valutesDict = valuteData.valute {
            for valutes in valutesDict {
                let valute = valutes.value
                self.valutes.append(valute)
            }
                print(self.valutes)
            }
        }
    }
    
    // MARK: - Table view data source
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
