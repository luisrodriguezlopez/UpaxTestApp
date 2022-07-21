//
//  SearchViewController.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation
import UIKit
import Alamofire

class SearchViewController: UIViewController {
    var presenter : SearchPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.presenter?.didLoad()
    }
        
}

extension SearchViewController : SearchViewProtocol {
    func loading() {
       
    }
    
    func dismissLoading() {
        
    }
    
}
