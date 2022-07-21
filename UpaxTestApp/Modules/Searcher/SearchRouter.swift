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
    func showSearchListwith(term: String ,result: [Result]?) {
        let searchListVC = SearchListTableView()
        searchListVC.view.backgroundColor = .groupTableViewBackground
       
        
        let interactor = SearchListInteractor()
            
        let presenter = SearchListPresenter(view: searchListVC , interactor: interactor)
            searchListVC.presenter = presenter
        searchListVC.presenter?.model = SearchListModel(results: result ?? [] , term: term )
            presenter.view = searchListVC
            presenter.interactor = interactor
            nav!.pushViewController(searchListVC, animated: true)

        
    }
    
    
}
