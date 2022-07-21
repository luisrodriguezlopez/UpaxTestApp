//
//  SearchListContract.swift
//  UpaxTestApp
//
//  Created by IMAC Luis on 21/07/22.
//

import Foundation


protocol SearchListInteractorProtocol: AnyObject {
    var output: SearchListInteractorOutput? { get set }
    func getSearchBy(term: String, currentPage: Int)
}

protocol SearchListInteractorOutput: AnyObject {
    func updateList(_ search: [Result]?)
    func receiveError(_ error: Error)
}

protocol SearchListPresenterProtocol {
    var view : SearchListViewProtocol? { get set }
    var interactor : SearchListInteractorProtocol? { get set }
    
    func prefetchByPage()
    
     init(view : SearchListViewProtocol, interactor:SearchListInteractorProtocol)
}

protocol SearchListViewProtocol: AnyObject {
    func loading()
    func dismissLoading()
    func updateList() 
}

