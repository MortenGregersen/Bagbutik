import Foundation

/**
 # ErrorResponse
 The error details that an API returns in the response body whenever the API request isn’t successful.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/errorresponse>
 */
public struct ErrorResponse: Codable, Sendable, Error {
    /// An array of one or more errors.
    public var errors: [Errors]?

    public init(errors: [Errors]? = nil) {
        self.errors = errors
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        errors = try container.decodeIfPresent([Errors].self, forKey: "errors")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(errors, forKey: "errors")
    }

    public struct Errors: Codable, Sendable, Identifiable {
        public let code: String
        public var detail: String?
        public var id: String?
        public var links: ErrorLinks?
        public var meta: Meta?
        public var source: Source?
        public let status: String
        public let title: String

        public init(code: String,
                    detail: String? = nil,
                    id: String? = nil,
                    links: ErrorLinks? = nil,
                    meta: Meta? = nil,
                    source: Source? = nil,
                    status: String,
                    title: String)
        {
            self.code = code
            self.detail = detail
            self.id = id
            self.links = links
            self.meta = meta
            self.source = source
            self.status = status
            self.title = title
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            code = try container.decode(String.self, forKey: "code")
            detail = try container.decodeIfPresent(String.self, forKey: "detail")
            id = try container.decodeIfPresent(String.self, forKey: "id")
            links = try container.decodeIfPresent(ErrorLinks.self, forKey: "links")
            meta = try container.decodeIfPresent(Meta.self, forKey: "meta")
            source = try container.decodeIfPresent(Source.self, forKey: "source")
            status = try container.decode(String.self, forKey: "status")
            title = try container.decode(String.self, forKey: "title")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(code, forKey: "code")
            try container.encodeIfPresent(detail, forKey: "detail")
            try container.encodeIfPresent(id, forKey: "id")
            try container.encodeIfPresent(links, forKey: "links")
            try container.encodeIfPresent(meta, forKey: "meta")
            try container.encodeIfPresent(source, forKey: "source")
            try container.encode(status, forKey: "status")
            try container.encode(title, forKey: "title")
        }

        public struct Meta: Codable, Sendable {
            public var additionalProperties: [String: String]?
            public var associatedErrors: [String: [Errors]]?

            public init(additionalProperties: [String: String]? = nil,
                        associatedErrors: [String: [Errors]]? = nil)
            {
                self.additionalProperties = additionalProperties
                self.associatedErrors = associatedErrors
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                additionalProperties = try container.decodeIfPresent([String: String].self, forKey: "additionalProperties")
                associatedErrors = try container.decodeIfPresent([String: [Errors]].self, forKey: "associatedErrors")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(additionalProperties, forKey: "additionalProperties")
                try container.encodeIfPresent(associatedErrors, forKey: "associatedErrors")
            }
        }

        public enum Source: Codable, Sendable {
            case jsonPointer(JsonPointer)
            case parameter(Parameter)

            public init(from decoder: Decoder) throws {
                if let jsonPointer = try? JsonPointer(from: decoder) {
                    self = .jsonPointer(jsonPointer)
                } else if let parameter = try? Parameter(from: decoder) {
                    self = .parameter(parameter)
                } else {
                    throw DecodingError.typeMismatch(Source.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                        debugDescription: "Unknown Source"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                switch self {
                case let .jsonPointer(value):
                    try value.encode(to: encoder)
                case let .parameter(value):
                    try value.encode(to: encoder)
                }
            }
        }
    }
}
