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
                        if searchResponse.total ?? 0 > 0 {
                            self.output?.receive(term: term, searchResponse.results)
                        }else {
                            self.output?.receiveError(NSError.init(domain: "", code: 0, userInfo:  [:]))
                        }
                    }catch {
                        self.output?.receiveError(error)
                    }
                }
                case .failure(let error):
                    self.output?.receiveError(error)
                }
        }
    }
    
}
