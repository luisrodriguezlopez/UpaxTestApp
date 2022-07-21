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
    
    lazy var searchBar : UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    
    var presenter : SearchPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.searchTextField.delegate = self
        self.searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        self.view.backgroundColor = .white
        // self.presenter?.didLoad()
    }
        
}

extension SearchViewController : SearchViewProtocol {
    func searchBy(term: String){
        self.presenter?.didSerch(term: term)
    }
    
    func loading() {
       
    }
    
    func dismissLoading() {
        
    }
}


extension SearchViewController : UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
   //     guard textField.text != "" else {
         
    //return
       // }
   
    
    // self.searchBy(term: textField.text!)
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBy(term: searchBar.text ?? "")

    }
}
