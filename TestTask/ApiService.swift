//
//  ApiService.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import Foundation

class APIService: NSObject {
    
    public static let shared = APIService()
    
    let urlStr = "https://newsapi.org/v2/everything?q=apple&from=2023-03-05&to=2023-03-05&sortBy=popularity&apiKey=4d9fecee8cdf40e28f99f87fce55d321"
    
    func apiToGetData(completion: @escaping (HeadLineResponseModel?, (Error?)) -> ()) {
        
        let url = URL(string: urlStr)
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error == nil {
                do {
                    let headLineInfo = try JSONDecoder().decode(HeadLineResponseModel.self, from: data!)
                    completion(headLineInfo, nil)
                }catch {
                    completion(nil, error)
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
}
