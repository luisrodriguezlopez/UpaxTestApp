//
//  SearchListModel.swift
//  UpaxTestApp
//
//  Created by IMAC Luis on 21/07/22.
//

import Foundation



class SearchListModel {
    var results : [Result]?
    var currentPage = 1
    var term : String?
    
    init(results : [Result], term : String ) {
        self.results = results
        self.term = term
    }
}
