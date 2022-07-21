//
//  SearchInteractor.swift
//  UpaxTestApp
//
//  Created by coppel on 19/07/22.
//

import Foundation
import Alamofire

class SearchInteractor : SearchInteractorProtocol {
    
    
    var output: SearchInteractorOutput?
    
    
    init() {
        
    }
    
    
    
    func getSearch() {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 8DkNaM9M2D6fdc4hIFXr8TdFHyajXlZn4hUT4tkLuVE",
            "Accept": "application/json"
        ]
        // HWui2Gmo2AbHzVp_kzeAQBVGfxFso8MpstGDng-TjbU


        AF.request("https://api.unsplash.com/search/photos?page=1&query=amor", headers: headers).responseDecodable(of: SearchResponse.self) { response in
            debugPrint(response.value ?? nil )
            self.output?.receive(response.value?.results ?? nil )
        }
    }
    
}
