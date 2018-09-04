//
//  Metadata.swift
//
//  Created by Anderson Carvalho on 03/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Metadata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kMetadataLinkKey: String = "link"
  private let kMetadataActionKey: String = "action"
  private let kMetadataMetaTagsKey: String = "meta_tags"
  private let kMetadataTextKey: String = "text"
  private let kMetadataImageKey: String = "image"
  private let kMetadataUrlsKey: String = "urls"
  private let kMetadataNewTabKey: String = "newTab"
  private let kMetadataTitleKey: String = "title"
  private let kMetadataTypeKey: String = "type"
  private let kMetadataCategoryKey: String = "category"
  private let kMetadataUrlKey: String = "url"
  private let kMetadataDurationKey: String = "duration"

  // MARK: Properties
  public var link: String?
  public var action: String?
  public var metaTags: [MetaTags]?
  public var text: String?
  public var image: String?
  public var urls: [Urls]?
  public var newTab: Bool = false
  public var title: String?
  public var type: String?
  public var category: String?
  public var url: String?
  public var duration: String?

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
    link <- map[kMetadataLinkKey]
    action <- map[kMetadataActionKey]
    metaTags <- map[kMetadataMetaTagsKey]
    text <- map[kMetadataTextKey]
    image <- map[kMetadataImageKey]
    urls <- map[kMetadataUrlsKey]
    newTab <- map[kMetadataNewTabKey]
    title <- map[kMetadataTitleKey]
    type <- map[kMetadataTypeKey]
    category <- map[kMetadataCategoryKey]
    url <- map[kMetadataUrlKey]
    duration <- map[kMetadataDurationKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = link { dictionary[kMetadataLinkKey] = value }
    if let value = action { dictionary[kMetadataActionKey] = value }
    if let value = metaTags { dictionary[kMetadataMetaTagsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = text { dictionary[kMetadataTextKey] = value }
    if let value = image { dictionary[kMetadataImageKey] = value }
    if let value = urls { dictionary[kMetadataUrlsKey] = value.map { $0.dictionaryRepresentation() } }
    dictionary[kMetadataNewTabKey] = newTab
    if let value = title { dictionary[kMetadataTitleKey] = value }
    if let value = type { dictionary[kMetadataTypeKey] = value }
    if let value = category { dictionary[kMetadataCategoryKey] = value }
    if let value = url { dictionary[kMetadataUrlKey] = value }
    if let value = duration { dictionary[kMetadataDurationKey] = value }
    return dictionary
  }

}
