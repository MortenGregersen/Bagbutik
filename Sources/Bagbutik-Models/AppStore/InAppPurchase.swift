import Bagbutik_Core
import Foundation

/**
 # InAppPurchase
 The data structure that represents the In-App Purchases resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase>
 */
public struct InAppPurchase: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "inAppPurchases" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    /**
     # InAppPurchase.Attributes
     Attributes that describe an In-App Purchases resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase/attributes>
     */
    public struct Attributes: Codable {
        public var inAppPurchaseType: InAppPurchaseType?
        public var productId: String?
        public var referenceName: String?
        public var state: State?

        public init(inAppPurchaseType: InAppPurchaseType? = nil,
                    productId: String? = nil,
                    referenceName: String? = nil,
                    state: State? = nil)
        {
            self.inAppPurchaseType = inAppPurchaseType
            self.productId = productId
            self.referenceName = referenceName
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            inAppPurchaseType = try container.decodeIfPresent(InAppPurchaseType.self, forKey: "inAppPurchaseType")
            productId = try container.decodeIfPresent(String.self, forKey: "productId")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            state = try container.decodeIfPresent(State.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(inAppPurchaseType, forKey: "inAppPurchaseType")
            try container.encodeIfPresent(productId, forKey: "productId")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(state, forKey: "state")
        }

        public enum InAppPurchaseType: String, Codable, CaseIterable {
            case automaticallyRenewableSubscription = "AUTOMATICALLY_RENEWABLE_SUBSCRIPTION"
            case consumable = "CONSUMABLE"
            case freeSubscription = "FREE_SUBSCRIPTION"
            case nonConsumable = "NON_CONSUMABLE"
            case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
        }

        public enum State: String, Codable, CaseIterable {
            case approved = "APPROVED"
            case created = "CREATED"
            case deleted = "DELETED"
            case deletionInProgress = "DELETION_IN_PROGRESS"
            case developerActionNeeded = "DEVELOPER_ACTION_NEEDED"
            case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
            case developerSignedOff = "DEVELOPER_SIGNED_OFF"
            case inReview = "IN_REVIEW"
            case missingMetadata = "MISSING_METADATA"
            case pendingDeveloperRelease = "PENDING_DEVELOPER_RELEASE"
            case prepareForSubmission = "PREPARE_FOR_SUBMISSION"
            case processingContent = "PROCESSING_CONTENT"
            case readyToSubmit = "READY_TO_SUBMIT"
            case rejected = "REJECTED"
            case removedFromSale = "REMOVED_FROM_SALE"
            case replaced = "REPLACED"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case waitingForScreenshot = "WAITING_FOR_SCREENSHOT"
            case waitingForUpload = "WAITING_FOR_UPLOAD"
        }
    }

    /**
     # InAppPurchase.Relationships
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase/relationships>
     */
    public struct Relationships: Codable {
        public var apps: Apps?

        public init(apps: Apps? = nil) {
            self.apps = apps
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            apps = try container.decodeIfPresent(Apps.self, forKey: "apps")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(apps, forKey: "apps")
        }

        /**
         # InAppPurchase.Relationships.Apps
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase/relationships/apps>
         */
        public struct Apps: Codable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # InAppPurchase.Relationships.Apps.Data
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase/relationships/apps/data>
             */
            public struct Data: Codable, Identifiable {
                public let id: String
                public var type: String { "apps" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }

            /**
             # InAppPurchase.Relationships.Apps.Links
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/inapppurchase/relationships/apps/links>
             */
            public struct Links: Codable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
