import Foundation
import Bagbutik_Core

/**
 # AppPreviewSetAppPreviewsLinkagesRequest
 A request body you use to reorder the app previews in a preview set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetapppreviewslinkagesrequest>
 */
public struct AppPreviewSetAppPreviewsLinkagesRequest: Codable, RequestBody {
    public let data: [Data]

    public init(data: [Data]) {
        self.data = data
    }

    /**
     # AppPreviewSetAppPreviewsLinkagesRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/apppreviewsetapppreviewslinkagesrequest/data>
     */
    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "appPreviews" }

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
