import Foundation

/**
 # AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageResponse
 A response that contains the ID of a single related App Store Versions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencereleasewithappstoreversionlinkageresponse>
 */
public struct AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageResponse: Codable {
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

    /**
     # AppClipDefaultExperienceReleaseWithAppStoreVersionLinkageResponse.Data
     The data element of the response body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdefaultexperiencereleasewithappstoreversionlinkageresponse/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the response.
        public let id: String
        /// The resource type.
        public var type: String { "appStoreVersions" }

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
            try container.encode(type, forKey: .type)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
        }
    }
}
