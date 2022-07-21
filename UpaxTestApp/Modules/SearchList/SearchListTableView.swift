//
//  SearchListTableView.swift
//  UpaxTestApp
//
//  Created by coppel on 20/07/22.
//

import Foundation
import UIKit


class SearchListTableView: UITableViewController , UITableViewDataSourcePrefetching  {

    var results: [Result]?
    var presenter : SearchListPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.prefetchDataSource = self
        self.tableView.isPrefetchingEnabled = true
        self.tableView.register(SearchViewCell.self, forCellReuseIdentifier: "searchViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter?.model?.results?.count ?? 0
        }else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "searchViewCell", for: indexPath) as? SearchViewCell else {
            return UITableViewCell()
        }
        guard let resultItem =  presenter?.model?.results?[indexPath.row] else {
            return UITableViewCell()
        }
        tableViewCell.setupCell(search: resultItem)
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if indexPath.row >=  ((presenter?.model?.results?.count ?? 0) - 3) {
                self.presenter?.prefetchByPage()
            }
        }
    }
}


extension SearchListTableView : SearchListViewProtocol {
    func updateList() {
        self.tableView.reloadData()
    }
    
    func loading() {
        
    }
    
    func dismissLoading() {
        
    }
    
    
}
