//
//  PostRequest.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PostRequest: BaseRequest {
    
    func post(parameters: [String: Any], url : String? = nil) -> DataRequest {
        print("request body: \(parameters)")
        
        var request : URLRequest
        if let url = url {
            request = URLRequest(url: URL(string: url)!)
            print("url: \(url)")
        } else {
            request = URLRequest(url: URL(string: self.mainURL)!)
        }
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = self.headers
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            print("httpBody: " + (parameters.description))
        } catch let error as NSError {
            debugPrint(error)
        }
        
        print(request.description)
        print("----")
        print(String(describing: request))
        return alamofireRequest(urlRequest: request)
    }
}
