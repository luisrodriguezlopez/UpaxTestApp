//
//  SearchListInteractor.swift
//  UpaxTestApp
//
//  Created by IMAC Luis on 21/07/22.
//

import Foundation
import Alamofire

class SearchListInteractor : SearchListInteractorProtocol {
  
    
    var output: SearchListInteractorOutput?
    var result : [Result]?

    
    func getSearchBy(term: String, currentPage: Int) {
        let headers: HTTPHeaders = [
            "Authorization": "Client-ID 8DkNaM9M2D6fdc4hIFXr8TdFHyajXlZn4hUT4tkLuVE",
            "Accept": "application/json"
        ]
        // HWui2Gmo2AbHzVp_kzeAQBVGfxFso8MpstGDng-TjbU


        AF.request("https://api.unsplash.com/search/photos?page=\(currentPage)&query=\(term)", headers: headers).responseJSON { response in
            switch response.result {
                    case .success:
                if(response.value != nil ) {
                    let jsonData = response.data
                    print("jsonData: \(jsonData)")
                    do{
                        let searchResponse  = try JSONDecoder().decode(SearchResponse.self, from: jsonData!)
                        if searchResponse.total ?? 0 > 0 {
                            self.output?.updateList(searchResponse.results)
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
