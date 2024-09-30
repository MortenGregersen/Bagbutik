import Bagbutik_Core
import Foundation

/**
 # BetaGroupUpdateRequest
 The request body you use to update a Beta Group.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest>
 */
public struct BetaGroupUpdateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # BetaGroupUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "betaGroups" }
        /// The resource's attributes.
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        /**
         # BetaGroupUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betagroupupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            public var feedbackEnabled: Bool?
            public var iosBuildsAvailableForAppleSiliconMac: Bool?
            /// The name for the beta group.
            public var name: String?
            /// A Boolean value that indicates whether a public link is enabled. Enabling a link allows you to invite anyone outside of your team to beta test your app. When you share this link, testers will be able to install the beta version of your app on their devices in TestFlight and share the link with others.
            public var publicLinkEnabled: Bool?
            /// The maximum number of testers that can join this beta group using the public link. Values must be between 1 and 10,000.
            public var publicLinkLimit: Int?
            /// A Boolean value that limits the number of testers who can join the beta group using the public link.
            public var publicLinkLimitEnabled: Bool?

            public init(feedbackEnabled: Bool? = nil,
                        iosBuildsAvailableForAppleSiliconMac: Bool? = nil,
                        name: String? = nil,
                        publicLinkEnabled: Bool? = nil,
                        publicLinkLimit: Int? = nil,
                        publicLinkLimitEnabled: Bool? = nil)
            {
                self.feedbackEnabled = feedbackEnabled
                self.iosBuildsAvailableForAppleSiliconMac = iosBuildsAvailableForAppleSiliconMac
                self.name = name
                self.publicLinkEnabled = publicLinkEnabled
                self.publicLinkLimit = publicLinkLimit
                self.publicLinkLimitEnabled = publicLinkLimitEnabled
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                feedbackEnabled = try container.decodeIfPresent(Bool.self, forKey: "feedbackEnabled")
                iosBuildsAvailableForAppleSiliconMac = try container.decodeIfPresent(Bool.self, forKey: "iosBuildsAvailableForAppleSiliconMac")
                name = try container.decodeIfPresent(String.self, forKey: "name")
                publicLinkEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkEnabled")
                publicLinkLimit = try container.decodeIfPresent(Int.self, forKey: "publicLinkLimit")
                publicLinkLimitEnabled = try container.decodeIfPresent(Bool.self, forKey: "publicLinkLimitEnabled")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(feedbackEnabled, forKey: "feedbackEnabled")
                try container.encodeIfPresent(iosBuildsAvailableForAppleSiliconMac, forKey: "iosBuildsAvailableForAppleSiliconMac")
                try container.encodeIfPresent(name, forKey: "name")
                try container.encodeIfPresent(publicLinkEnabled, forKey: "publicLinkEnabled")
                try container.encodeIfPresent(publicLinkLimit, forKey: "publicLinkLimit")
                try container.encodeIfPresent(publicLinkLimitEnabled, forKey: "publicLinkLimitEnabled")
            }
        }
    }
}
