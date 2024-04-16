import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionDomainCreateRequest
 The request body you use to create an alternative distribution domain.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomaincreaterequest>
 */
public struct AlternativeDistributionDomainCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public struct Data: Codable {
        public var type: String { "alternativeDistributionDomains" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case type
        }

        /**
         # AlternativeDistributionDomainCreateRequest.Data.Attributes
         Attributes that describe an alternative distribution domain create resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomaincreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let domain: String
            public let referenceName: String

            public init(domain: String,
                        referenceName: String)
            {
                self.domain = domain
                self.referenceName = referenceName
            }
        }
    }
}
