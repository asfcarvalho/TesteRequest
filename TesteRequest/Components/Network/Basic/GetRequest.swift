//
//  GetRequest.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class GetRequest: BaseRequest {
    
    
    func get() -> DataRequest{
        
        var request = URLRequest(url: URL(string: self.mainURL)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = self.headers
        
        print("get headers: \(String(describing: self.headers))")
        
        return alamofireRequest(urlRequest: request)
    }
}

