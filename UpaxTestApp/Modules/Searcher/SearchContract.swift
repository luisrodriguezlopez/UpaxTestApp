//
//  SearchContract.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation


protocol SearchInteractorProtocol: AnyObject {
    var output: SearchInteractorOutput? { get set }
    func getSearchBy(term: String)
//    init(service: SearchServiceProtocol)
}

protocol SearchInteractorOutput: AnyObject {
    func receive(_ search: [Result]?)
    func receiveError(_ error: Error)
}

protocol SearchPresenterProtocol {
    var view : SearchViewProtocol? { get set }
    var router : SearchRouterProtocol? { get set }
    var interactor : SearchInteractorProtocol? { get set }
    
    func didSerch(term : String)
    
     init(view : SearchViewProtocol, router: SearchRouterProtocol, interactor:SearchInteractorProtocol)
}

protocol SearchViewProtocol: AnyObject {
    func searchBy(term: String)
    func loading()
    func dismissLoading()
}

protocol SearchRouterProtocol: AnyObject {
    func showSearchListwith(result: [Result]?)
}
