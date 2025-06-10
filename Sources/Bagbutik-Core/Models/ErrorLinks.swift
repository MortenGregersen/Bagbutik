import Foundation

public struct ErrorLinks: Codable, Sendable {
    public var about: String?
    public var associated: Associated?

    public init(about: String? = nil,
                associated: Associated? = nil)
    {
        self.about = about
        self.associated = associated
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        about = try container.decodeIfPresent(String.self, forKey: "about")
        associated = try container.decodeIfPresent(Associated.self, forKey: "associated")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(about, forKey: "about")
        try container.encodeIfPresent(associated, forKey: "associated")
    }

    public enum Associated: Codable, Sendable {
        case properties(Properties)
        case string(String)

        public init(from decoder: Decoder) throws {
            if let properties = try? Properties(from: decoder) {
                self = .properties(properties)
            } else if let string = try? String(from: decoder) {
                self = .string(string)
            } else {
                throw DecodingError.typeMismatch(
                    Associated.self,
                    DecodingError.Context(
                        codingPath: decoder.codingPath,
                        debugDescription: "Unknown Associated"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .properties(value):
                try value.encode(to: encoder)
            case let .string(value):
                try value.encode(to: encoder)
            }
        }

        public struct Properties: Codable, Sendable {
            public var href: String?
            public var meta: Meta?

            public init(href: String? = nil,
                        meta: Meta? = nil)
            {
                self.href = href
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                href = try container.decodeIfPresent(String.self, forKey: "href")
                meta = try container.decodeIfPresent(Meta.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(href, forKey: "href")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Meta: Codable, Sendable {
                public var source: String?

                public init(source: String? = nil) {
                    self.source = source
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    source = try container.decodeIfPresent(String.self, forKey: "source")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(source, forKey: "source")
                }
            }
        }
    }
}
