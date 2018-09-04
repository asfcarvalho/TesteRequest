//
//  BaseRequest.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest: NSObject {
    
    var mainURL: String = ServiceParamter.url
    var headers: HTTPHeaders?
    typealias defaultResponse = (String, String?) -> Void
    typealias anyObjectResponse = (Any?, String?) -> Void
    
    init(endpoint: String) {
        super.init()
        let urlString = endpoint
        self.mainURL = urlString
        headers = ServiceParamter.header
        
        print("request url: \(mainURL)")
        //print("request headers: \(headers)")
    }
    
    init(url: String, endpoint: String, headers: HTTPHeaders? = nil){
        super.init()
        self.mainURL = "\(url)\(endpoint)"
        if headers != nil {
            self.headers = headers
            //print("request headers: \(headers)")
        }
        
        print("request url: \(mainURL)")
        
    }
    
    func request(parameters: [String: Any], method: HTTPMethod) -> DataRequest {
        print("request body: \(parameters)")
        return Alamofire.request(mainURL, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func alamofireRequest(urlRequest: URLRequestConvertible) -> DataRequest {
        let request = Alamofire.request(urlRequest)
        print("sessionDescription: " + (request.session.sessionDescription ?? " "))
        return request
    }
    
    static func setHeader(userToken : String? = nil) {
        
    }
}
