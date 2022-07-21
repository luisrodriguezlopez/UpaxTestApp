//
//  SearchListPresenter.swift
//  UpaxTestApp
//
//  Created by IMAC Luis on 21/07/22.
//

import Foundation


class SearchListPresenter : SearchListPresenterProtocol {

    weak var view: SearchListViewProtocol?
    var model : SearchListModel?
    var interactor: SearchListInteractorProtocol?
    
    required init(view: SearchListViewProtocol, interactor: SearchListInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.interactor?.output = self
        
    }
    
    func prefetchByPage() {
        self.interactor?.getSearchBy(term: self.model?.term ?? "", currentPage: self.model?.currentPage ?? 2)
    }
}

extension SearchListPresenter : SearchListInteractorOutput {
    func updateList(_ search: [Result]?) {
        self.model?.currentPage  =  (self.model?.currentPage ?? 0) + 1
        self.model?.results?.append(contentsOf: search ?? [])
        self.view?.updateList()
    }
    

    func receiveError(_ error: Error) {
       // self.view?.showTryAgaint()
    }
    
}
