//
//  SearchViewController.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation
import UIKit
import Alamofire
import Lottie

class SearchViewController: UIViewController {
    
    lazy var searchBar : UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var animationViewLoading : AnimationView = {
        var animationView = AnimationView(name: "pinging-line")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    lazy var animationError : AnimationView = {
        var animationView = AnimationView(name: "search-not-found.json")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.isHidden = true
        return animationView
    }()
    
    
    var presenter : SearchPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // self.presenter?.didLoad()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        self.searchBar.searchTextField.delegate = self
        self.searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        self.view.addSubview(animationViewLoading)
        self.view.addSubview(animationError)
        
        NSLayoutConstraint.activate([
            self.animationViewLoading.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            self.animationViewLoading.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 8),
            self.animationViewLoading.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            self.animationViewLoading.heightAnchor.constraint(equalToConstant: 4.0)
        ])
        
        
        NSLayoutConstraint.activate([
            self.animationError.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            self.animationError.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 8),
            self.animationError.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8),
            self.animationError.heightAnchor.constraint(equalToConstant: 200.0)
        ])

    }
        
}

extension SearchViewController : SearchViewProtocol {
    func searchBy(term: String){
        self.presenter?.didSerch(term: term)
    }
    
    func loading() {
        self.animationViewLoading.play()

    }
    
    func dismissLoading() {
        self.animationViewLoading.stop()
    }
    
    func showTryAgaint() {
        dismissLoading()
        self.animationError.isHidden = false
        self.animationError.play()
    }
}


extension SearchViewController : UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.loading()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.resignFirstResponder()
        self.animationError.isHidden = true
   //     guard textField.text != "" else {
         
    //return
       // }
   
    
    // self.searchBy(term: textField.text!)
    }
}

extension SearchViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.searchTextField.resignFirstResponder()
        self.searchBy(term: searchBar.text ?? "")

    }
}
