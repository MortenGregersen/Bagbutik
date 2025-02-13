import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BetaRecruitmentCriterionCreateRequest
 The request body you use to create a beta recruitment criterion.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betarecruitmentcriterioncreaterequest>
 */
public struct BetaRecruitmentCriterionCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "betaRecruitmentCriteria" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable, Sendable {
            public let deviceFamilyOsVersionFilters: [DeviceFamilyOsVersionFilter]

            public init(deviceFamilyOsVersionFilters: [DeviceFamilyOsVersionFilter]) {
                self.deviceFamilyOsVersionFilters = deviceFamilyOsVersionFilters
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                deviceFamilyOsVersionFilters = try container.decode([DeviceFamilyOsVersionFilter].self, forKey: "deviceFamilyOsVersionFilters")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(deviceFamilyOsVersionFilters, forKey: "deviceFamilyOsVersionFilters")
            }
        }

        public struct Relationships: Codable, Sendable {
            public let betaGroup: BetaGroup

            public init(betaGroup: BetaGroup) {
                self.betaGroup = betaGroup
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                betaGroup = try container.decode(BetaGroup.self, forKey: "betaGroup")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(betaGroup, forKey: "betaGroup")
            }

            public struct BetaGroup: Codable, Sendable {
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
                    public var type: String { "betaGroups" }

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
        }
    }
}
