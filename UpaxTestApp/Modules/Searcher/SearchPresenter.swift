//
//  SearchPresenter.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation


class SearchPresenter : SearchPresenterProtocol{
    weak var view: SearchViewProtocol?
    
    var router: SearchRouterProtocol?
    
    var interactor: SearchInteractorProtocol?
    
    required init(view: SearchViewProtocol, router: SearchRouterProtocol, interactor: SearchInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.interactor?.output = self
        
    }
    
    func didSerch(term : String) {
        self.interactor?.getSearchBy(term: term)
    }
    
}

extension SearchPresenter : SearchInteractorOutput {
    func receive(term: String ,_ search: [Result]?) {
        guard search != nil else  { return }
        self.router?.showSearchListwith(term: term, result: search)
    }
    
    func receiveError(_ error: Error) {
        self.view?.showTryAgaint()
    }
    
}
