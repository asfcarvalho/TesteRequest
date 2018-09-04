//
//  BaseStatus.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseStatus: Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private let kBaseStatusSuccessKey: String = "success"
    private let kBaseStatusMessageKey: String = "message"
    
    // MARK: Properties
    public var success: Bool = false
    public var message: String?
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        success <- map[kBaseStatusSuccessKey]
        message <- map[kBaseStatusMessageKey]
    }
}
