import Foundation

/**
 # AndroidToIosAppMappingDetailUpdateRequest
 The request body you use to update an Android to iOS app mapping detail update request.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/androidtoiosappmappingdetailupdaterequest>
 */
public struct AndroidToIosAppMappingDetailUpdateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "androidToIosAppMappingDetails" }
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

        public struct Attributes: Codable, Sendable {
            public var appSigningKeyPublicCertificateSha256Fingerprints: [String]?
            public var packageName: String?

            public init(appSigningKeyPublicCertificateSha256Fingerprints: [String]? = nil,
                        packageName: String? = nil)
            {
                self.appSigningKeyPublicCertificateSha256Fingerprints = appSigningKeyPublicCertificateSha256Fingerprints
                self.packageName = packageName
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appSigningKeyPublicCertificateSha256Fingerprints = try container.decodeIfPresent([String].self, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
                packageName = try container.decodeIfPresent(String.self, forKey: "packageName")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(appSigningKeyPublicCertificateSha256Fingerprints, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
                try container.encodeIfPresent(packageName, forKey: "packageName")
            }
        }
    }
}
