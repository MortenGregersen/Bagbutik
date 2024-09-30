import Bagbutik_Core
import Foundation

/**
 # AppStoreVersionBuildLinkageRequest
 The request body you use to attach a build to an App Store version.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionbuildlinkagerequest>
 */
public struct AppStoreVersionBuildLinkageRequest: Codable, Sendable, RequestBody {
    @NullCodable public var data: Data?

    public init(data: Data? = nil) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decodeIfPresent(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    /**
     # AppStoreVersionBuildLinkageRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionbuildlinkagerequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "builds" }

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
