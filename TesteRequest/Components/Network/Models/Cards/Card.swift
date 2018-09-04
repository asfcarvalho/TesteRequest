//
//  Response.swift
//
//  Created by Anderson Carvalho on 03/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Card: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kResponseMetadataKey: String = "metadata"
  private let kResponseDateStartKey: String = "dateStart"
  private let kResponseCreatedAtKey: String = "createdAt"
  private let kResponseUserIdKey: String = "userId"
  private let kResponseActiveKey: String = "active"
  private let kResponseTagsKey: String = "tags"
  private let kResponseDateEndKey: String = "dateEnd"
  private let kResponseMenuKey: String = "menu"
  private let kResponseInternalIdentifierKey: String = "id"
  private let kResponseDeletedAtKey: String = "deletedAt"
  private let kResponseCampaignIdKey: String = "campaignId"
  private let kResponseTemplateKey: String = "template"
  private let kResponseCreatedByKey: String = "createdBy"

  // MARK: Properties
  public var metadata: [Metadata]?
  public var dateStart: String?
  public var createdAt: String?
  public var userId: Int?
  public var active: Bool = false
  public var tags: [String]?
  public var dateEnd: String?
  public var menu: Int?
  public var internalIdentifier: String?
  public var deletedAt: String?
  public var campaignId: Int?
  public var template: Int?
  public var createdBy: Int?
  public var height: CGFloat?

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
    metadata <- map[kResponseMetadataKey]
    dateStart <- map[kResponseDateStartKey]
    createdAt <- map[kResponseCreatedAtKey]
    userId <- map[kResponseUserIdKey]
    active <- map[kResponseActiveKey]
    tags <- map[kResponseTagsKey]
    dateEnd <- map[kResponseDateEndKey]
    menu <- map[kResponseMenuKey]
    internalIdentifier <- map[kResponseInternalIdentifierKey]
    deletedAt <- map[kResponseDeletedAtKey]
    campaignId <- map[kResponseCampaignIdKey]
    template <- map[kResponseTemplateKey]
    createdBy <- map[kResponseCreatedByKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = metadata { dictionary[kResponseMetadataKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = dateStart { dictionary[kResponseDateStartKey] = value }
    if let value = createdAt { dictionary[kResponseCreatedAtKey] = value }
    if let value = userId { dictionary[kResponseUserIdKey] = value }
    dictionary[kResponseActiveKey] = active
    if let value = tags { dictionary[kResponseTagsKey] = value }
    if let value = dateEnd { dictionary[kResponseDateEndKey] = value }
    if let value = menu { dictionary[kResponseMenuKey] = value }
    if let value = internalIdentifier { dictionary[kResponseInternalIdentifierKey] = value }
    if let value = deletedAt { dictionary[kResponseDeletedAtKey] = value }
    if let value = campaignId { dictionary[kResponseCampaignIdKey] = value }
    if let value = template { dictionary[kResponseTemplateKey] = value }
    if let value = createdBy { dictionary[kResponseCreatedByKey] = value }
    return dictionary
  }

}
