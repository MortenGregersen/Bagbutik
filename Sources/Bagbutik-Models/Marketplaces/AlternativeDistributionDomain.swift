import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionDomain
 The data structure that represents an alternative distribution domain resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomain>
 */
public struct AlternativeDistributionDomain: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionDomains" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # AlternativeDistributionDomain.Attributes
     Attributes that describe an alternative distribution domain resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributiondomain/attributes>
     */
    public struct Attributes: Codable {
        public var createdDate: Date?
        public var domain: String?
        public var referenceName: String?

        public init(createdDate: Date? = nil,
                    domain: String? = nil,
                    referenceName: String? = nil)
        {
            self.createdDate = createdDate
            self.domain = domain
            self.referenceName = referenceName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            createdDate = try container.decodeIfPresent(Date.self, forKey: .createdDate)
            domain = try container.decodeIfPresent(String.self, forKey: .domain)
            referenceName = try container.decodeIfPresent(String.self, forKey: .referenceName)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(createdDate, forKey: .createdDate)
            try container.encodeIfPresent(domain, forKey: .domain)
            try container.encodeIfPresent(referenceName, forKey: .referenceName)
        }

        private enum CodingKeys: String, CodingKey {
            case createdDate
            case domain
            case referenceName
        }
    }
}
