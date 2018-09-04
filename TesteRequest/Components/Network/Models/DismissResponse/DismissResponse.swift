//
//  DismissResponse.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 03/09/2018.
//  Copyright © 2018 Natura. All rights reserved.
//

import Foundation
import ObjectMapper

public class DismissResponse: Mappable {
    
    var baseStatus: BaseStatus?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        baseStatus <- map["status"]
    }
}
