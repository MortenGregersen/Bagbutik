import Bagbutik_Core
import Foundation

/**
 # RoutingAppCoverageUpdateRequest
 The request body you use to update a Routing App Coverage.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/routingappcoverageupdaterequest>
 */
public struct RoutingAppCoverageUpdateRequest: Codable, Sendable, RequestBody {
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
     # RoutingAppCoverageUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/routingappcoverageupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "routingAppCoverages" }
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
         # RoutingAppCoverageUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/routingappcoverageupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            public var sourceFileChecksum: String?
            public var uploaded: Bool?

            public init(sourceFileChecksum: String? = nil,
                        uploaded: Bool? = nil)
            {
                self.sourceFileChecksum = sourceFileChecksum
                self.uploaded = uploaded
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: "sourceFileChecksum")
                uploaded = try container.decodeIfPresent(Bool.self, forKey: "uploaded")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(sourceFileChecksum, forKey: "sourceFileChecksum")
                try container.encodeIfPresent(uploaded, forKey: "uploaded")
            }
        }
    }
}
