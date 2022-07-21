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

    func getSearchBy(term: String) {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 8DkNaM9M2D6fdc4hIFXr8TdFHyajXlZn4hUT4tkLuVE",
            "Accept": "application/json"
        ]
        // HWui2Gmo2AbHzVp_kzeAQBVGfxFso8MpstGDng-TjbU


        AF.request("https://api.unsplash.com/search/photos?page=1&query=\(term)", headers: headers).responseJSON { response in
            switch response.result {
                    case .success:
                if(response.value != nil ) {
                    let jsonData = response.data
                    print("jsonData: \(jsonData)")
                    do{
                        let searchResponse  = try JSONDecoder().decode(SearchResponse.self, from: jsonData!)
                        self.output?.receive(searchResponse.results)
                    }catch {
                        print("Error: \(error)")
                    }
                }
                case .failure(let error):
                    print(error)
                }
        }
    }
    
}
