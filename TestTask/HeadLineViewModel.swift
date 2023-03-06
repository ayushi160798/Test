//
//  HeadLineViewModel.swift
//  TestTask
//
//  Created by Dr.Mac on 06/03/2023.
//

import Foundation

class HeadLineViewModel : NSObject {
    
    override init() {
        super.init()
    }
    
    
    func getHeadLineData(completion: @escaping (HeadLineResponseModel?, (Error?)) -> ()) {
        APIService.shared.apiToGetData(completion: { (userInfo , error)    in
            completion(userInfo, error)
        })
    }
    

}
