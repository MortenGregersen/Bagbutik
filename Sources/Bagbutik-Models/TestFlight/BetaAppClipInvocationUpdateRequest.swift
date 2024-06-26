import Bagbutik_Core
import Foundation

/**
 # BetaAppClipInvocationUpdateRequest
 The request body you use to update a Beta App Clip Invocation.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest>
 */
public struct BetaAppClipInvocationUpdateRequest: Codable, RequestBody {
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
     # BetaAppClipInvocationUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the request.
        public let id: String
        /// The resource type.
        public var type: String { "betaAppClipInvocations" }
        /// The attributes that describe the request that updates a Beta App Clip Invocations resource.
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
         # BetaAppClipInvocationUpdateRequest.Data.Attributes
         The attributes you set that describe the updated Beta App Clip Invocations resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The invocation URL you configure for testers who use the TestFlight to launch your App Clip.
            public var url: String?

            public init(url: String? = nil) {
                self.url = url
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                url = try container.decodeIfPresent(String.self, forKey: "url")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(url, forKey: "url")
            }
        }
    }
}
