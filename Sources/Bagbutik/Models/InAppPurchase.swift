import Foundation

public struct InAppPurchase: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "inAppPurchases" }
    public let attributes: Attributes?
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    public struct Attributes: Codable {
        public let inAppPurchaseType: InAppPurchaseType?
        public let productId: String?
        public let referenceName: String?
        public let state: State?

        public init(inAppPurchaseType: InAppPurchaseType? = nil, productId: String? = nil, referenceName: String? = nil, state: State? = nil) {
            self.inAppPurchaseType = inAppPurchaseType
            self.productId = productId
            self.referenceName = referenceName
            self.state = state
        }

        public enum InAppPurchaseType: String, Codable, CaseIterable {
            case automaticallyRenewableSubscription = "AUTOMATICALLY_RENEWABLE_SUBSCRIPTION"
            case nonConsumable = "NON_CONSUMABLE"
            case consumable = "CONSUMABLE"
            case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
            case freeSubscription = "FREE_SUBSCRIPTION"
        }

        public enum State: String, Codable, CaseIterable {
            case created = "CREATED"
            case developerSignedOff = "DEVELOPER_SIGNED_OFF"
            case developerActionNeeded = "DEVELOPER_ACTION_NEEDED"
            case deletionInProgress = "DELETION_IN_PROGRESS"
            case approved = "APPROVED"
            case deleted = "DELETED"
            case removedFromSale = "REMOVED_FROM_SALE"
            case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
            case waitingForUpload = "WAITING_FOR_UPLOAD"
            case processingContent = "PROCESSING_CONTENT"
            case replaced = "REPLACED"
            case rejected = "REJECTED"
            case waitingForScreenshot = "WAITING_FOR_SCREENSHOT"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case missingMetadata = "MISSING_METADATA"
            case readyToSubmit = "READY_TO_SUBMIT"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
        }
    }

    public struct Relationships: Codable {
        public let apps: Apps?

        public init(apps: Apps? = nil) {
            self.apps = apps
        }

        public struct Apps: Codable {
            public let data: [Data]?
            public let links: Links?
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public struct Data: Codable {
                public let id: String
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            public struct Links: Codable {
                public let related: String?
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
