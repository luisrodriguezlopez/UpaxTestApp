//
//  SearchRouter.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation
import UIKit


class SearchRouter : SearchRouterProtocol {
    public var nav : UINavigationController?
    func showSearchListwith(result: [Result]?) {
        let searchListVC = SearchListTableView()
        searchListVC.view.backgroundColor = .groupTableViewBackground
        searchListVC.results = result
        nav?.pushViewController(searchListVC, animated: true)
    }
    
    
}
