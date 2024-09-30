import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionAppClipDefaultExperienceLinkageResponse
 A response that contains the ID of a single related Default App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionappclipdefaultexperiencelinkageresponse>
 */
public struct AppStoreVersionAppClipDefaultExperienceLinkageResponse: Codable, Sendable {
    /// The object types and IDs of the related resources.
    public let data: Data
    /// Navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: Data,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }

    /**
     # AppStoreVersionAppClipDefaultExperienceLinkageResponse.Data
     The data element of the response body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionappclipdefaultexperiencelinkageresponse/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The opaque resource ID that uniquely identifies the response.
        public let id: String
        /// The resource type.
        public var type: String { "appClipDefaultExperiences" }

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
}
