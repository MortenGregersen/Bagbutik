import Foundation

/**
 The request body you use to update an App Update.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest>
 */
public struct AppUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The included related resources.
    public let included: [AppPriceInlineCreate]?

    public init(data: Data, included: [AppPriceInlineCreate]? = nil) {
        self.data = data
        self.included = included
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "apps" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let availableInNewTerritories: Bool?
            public let bundleId: String?
            public let contentRightsDeclaration: App.Attributes.ContentRightsDeclaration?
            public let primaryLocale: String?

            public init(availableInNewTerritories: Bool? = nil, bundleId: String? = nil, contentRightsDeclaration: App.Attributes.ContentRightsDeclaration? = nil, primaryLocale: String? = nil) {
                self.availableInNewTerritories = availableInNewTerritories
                self.bundleId = bundleId
                self.contentRightsDeclaration = contentRightsDeclaration
                self.primaryLocale = primaryLocale
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let availableTerritories: AvailableTerritories?
            public let prices: Prices?

            public init(availableTerritories: AvailableTerritories? = nil, prices: Prices? = nil) {
                self.availableTerritories = availableTerritories
                self.prices = prices
            }

            public struct AvailableTerritories: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/availableterritories/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "territories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct Prices: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appupdaterequest/data/relationships/prices/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appPrices" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
