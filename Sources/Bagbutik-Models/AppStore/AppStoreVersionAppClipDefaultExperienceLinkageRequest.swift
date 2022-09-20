import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionAppClipDefaultExperienceLinkageRequest
 The request body you use to attach a default App Clip experience to an App Store version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionappclipdefaultexperiencelinkagerequest>
 */
public struct AppStoreVersionAppClipDefaultExperienceLinkageRequest: Codable, RequestBody {
    /// The types and IDs of related resources.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "appClipDefaultExperiences" }

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
