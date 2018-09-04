//
//  Urls.swift
//
//  Created by Anderson Carvalho on 03/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Urls: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kUrlsNewTabKey: String = "newTab"
  private let kUrlsLinkKey: String = "link"
  private let kUrlsImageKey: String = "image"

  // MARK: Properties
  public var newTab: Bool = false
  public var link: String?
  public var image: String?

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
    newTab <- map[kUrlsNewTabKey]
    link <- map[kUrlsLinkKey]
    image <- map[kUrlsImageKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kUrlsNewTabKey] = newTab
    if let value = link { dictionary[kUrlsLinkKey] = value }
    if let value = image { dictionary[kUrlsImageKey] = value }
    return dictionary
  }

}
