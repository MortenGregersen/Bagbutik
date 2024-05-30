import Bagbutik_Core
import Foundation

public struct Actor: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "actors" }
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

    public struct Attributes: Codable {
        public var actorType: ActorType?
        public var apiKeyId: String?
        public var userEmail: String?
        public var userFirstName: String?
        public var userLastName: String?

        public init(actorType: ActorType? = nil,
                    apiKeyId: String? = nil,
                    userEmail: String? = nil,
                    userFirstName: String? = nil,
                    userLastName: String? = nil)
        {
            self.actorType = actorType
            self.apiKeyId = apiKeyId
            self.userEmail = userEmail
            self.userFirstName = userFirstName
            self.userLastName = userLastName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            actorType = try container.decodeIfPresent(ActorType.self, forKey: .actorType)
            apiKeyId = try container.decodeIfPresent(String.self, forKey: .apiKeyId)
            userEmail = try container.decodeIfPresent(String.self, forKey: .userEmail)
            userFirstName = try container.decodeIfPresent(String.self, forKey: .userFirstName)
            userLastName = try container.decodeIfPresent(String.self, forKey: .userLastName)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(actorType, forKey: .actorType)
            try container.encodeIfPresent(apiKeyId, forKey: .apiKeyId)
            try container.encodeIfPresent(userEmail, forKey: .userEmail)
            try container.encodeIfPresent(userFirstName, forKey: .userFirstName)
            try container.encodeIfPresent(userLastName, forKey: .userLastName)
        }

        private enum CodingKeys: String, CodingKey {
            case actorType
            case apiKeyId
            case userEmail
            case userFirstName
            case userLastName
        }

        public enum ActorType: String, Codable, CaseIterable {
            case apiKey = "API_KEY"
            case apple = "APPLE"
            case user = "USER"
            case xcodeCloud = "XCODE_CLOUD"
        }
    }
}
