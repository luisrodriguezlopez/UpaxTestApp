//
//  SearchListTableView.swift
//  UpaxTestApp
//
//  Created by coppel on 20/07/22.
//

import Foundation
import UIKit


class SearchListTableView: UITableViewController {

    var results: [Result]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(SearchViewCell.self, forCellReuseIdentifier: "searchViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchViewCell", for: indexPath) as? SearchViewCell else {
            return UITableViewCell()
        }
        guard let resultItem = results?[indexPath.row] else {
            return UITableViewCell()
        }
        tableViewCell.setupCell(search: resultItem)
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
