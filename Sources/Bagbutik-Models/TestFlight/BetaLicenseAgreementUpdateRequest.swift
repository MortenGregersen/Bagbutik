import Bagbutik_Core
import Foundation

/**
 # BetaLicenseAgreementUpdateRequest
 The request body you use to update a Beta License Agreement.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betalicenseagreementupdaterequest>
 */
public struct BetaLicenseAgreementUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable, Identifiable {
        public let id: String
        public var type: String { "betaLicenseAgreements" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case type
        }

        public struct Attributes: Codable {
            public var agreementText: String?

            public init(agreementText: String? = nil) {
                self.agreementText = agreementText
            }
        }
    }
}
