import Foundation

/**
 # ErrorResponse
 Information with error details that an API returns in the response body whenever the API request is not successful.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/errorresponse>
 */
public struct ErrorResponse: Codable {
    /// An array of one or more errors.
    public var errors: [Errors]?

    public init(errors: [Errors]? = nil) {
        self.errors = errors
    }

    public struct Errors: Codable, Identifiable {
        public let code: String
        public var detail: String?
        public var id: String?
        public var meta: Meta?
        public var source: Source?
        public let status: String
        public let title: String

        public init(code: String,
                    detail: String? = nil,
                    id: String? = nil,
                    meta: Meta? = nil,
                    source: Source? = nil,
                    status: String,
                    title: String)
        {
            self.code = code
            self.detail = detail
            self.id = id
            self.meta = meta
            self.source = source
            self.status = status
            self.title = title
        }

        public struct Meta: Codable {
            public var associatedErrors: [String: [Errors]]?

            public init(associatedErrors: [String: [Errors]]? = nil) {
                self.associatedErrors = associatedErrors
            }
        }

        public enum Source: Codable {
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

            private enum CodingKeys: String, CodingKey {
                case type
            }
        }
    }
}
