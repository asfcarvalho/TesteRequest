//
//  Cards.swift
//  TesteRequest
//
//  Created by Anderson Carvalho on 03/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import ObjectMapper

public class CardResponse: Mappable {
    
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private let kResponseKey: String = "response"
    private let kResponseStatusKey: String = "status"
    
    // MARK: Properties
    public var response: [Card]?
    public var baseStatus: BaseStatus?
    
    
    public required init?(map: Map) {
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        response <- map[kResponseKey]
        baseStatus <- map[kResponseStatusKey]
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = response { dictionary[kResponseKey] = value.map { $0.dictionaryRepresentation() } }
        if let value = baseStatus { dictionary[kResponseKey] = value }
        return dictionary
    }
}
