import Foundation

/**
 # ErrorResponse
 The error details that an API returns in the response body whenever the API request isn’t successful.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/errorresponse>
 */
public struct ErrorResponse: Codable {
    /// An array of one or more errors.
    public var errors: [Errors]?

    public init(errors: [Errors]? = nil) {
        self.errors = errors
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        errors = try container.decodeIfPresent([Errors].self, forKey: .errors)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(errors, forKey: .errors)
    }

    private enum CodingKeys: String, CodingKey {
        case errors
    }

    /**
     # ErrorResponse.Errors
     The details about an error that are returned when an API request isn’t successful.

     Use the `code` parameter for programmatic error handling. See [Parsing the Error Response Code](https://developer.apple.com/documentation/appstoreconnectapi/interpreting_and_handling_errors/parsing_the_error_response_code) for more information. For more information about using the `source` parameter, see [Pinpointing the Location of Errors](https://developer.apple.com/documentation/appstoreconnectapi/interpreting_and_handling_errors/pinpointing_the_location_of_errors).

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/errorresponse/errors>
     */
    public struct Errors: Codable, Identifiable {
        /// A machine-readable code indicating the type of error. The code is a hierarchical value with levels of specificity separated by the '`.`' character. This value is parseable for programmatic error handling in code.
        public let code: String
        /// A detailed explanation of the error. Do not use this field for programmatic error handling.
        public var detail: String?
        /// The unique ID of a specific instance of an error, request, and response. Use this ID when providing feedback to or debugging issues with Apple.
        public var id: String?
        public var meta: Meta?
        /// One of two possible types of values: `source.Parameter`, provided when a query parameter produced the error, or `source.JsonPointer`, provided when a problem with the entity produced the error.
        public var source: Source?
        /// The HTTP status code of the error. This status code usually matches the response's status code; however, if the request produces multiple errors, these two codes may differ.
        public let status: String
        /// A summary of the error. Do not use this field for programmatic error handling.
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            code = try container.decode(String.self, forKey: .code)
            detail = try container.decodeIfPresent(String.self, forKey: .detail)
            id = try container.decodeIfPresent(String.self, forKey: .id)
            meta = try container.decodeIfPresent(Meta.self, forKey: .meta)
            source = try container.decodeIfPresent(Source.self, forKey: .source)
            status = try container.decode(String.self, forKey: .status)
            title = try container.decode(String.self, forKey: .title)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(code, forKey: .code)
            try container.encodeIfPresent(detail, forKey: .detail)
            try container.encodeIfPresent(id, forKey: .id)
            try container.encodeIfPresent(meta, forKey: .meta)
            try container.encodeIfPresent(source, forKey: .source)
            try container.encode(status, forKey: .status)
            try container.encode(title, forKey: .title)
        }

        private enum CodingKeys: String, CodingKey {
            case code
            case detail
            case id
            case meta
            case source
            case status
            case title
        }

        public struct Meta: Codable {
            public var additionalProperties: [String: String]?
            public var associatedErrors: [String: [Errors]]?

            public init(additionalProperties: [String: String]? = nil,
                        associatedErrors: [String: [Errors]]? = nil)
            {
                self.additionalProperties = additionalProperties
                self.associatedErrors = associatedErrors
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                additionalProperties = try container.decodeIfPresent([String: String].self, forKey: .additionalProperties)
                associatedErrors = try container.decodeIfPresent([String: [Errors]].self, forKey: .associatedErrors)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(additionalProperties, forKey: .additionalProperties)
                try container.encodeIfPresent(associatedErrors, forKey: .associatedErrors)
            }

            private enum CodingKeys: String, CodingKey {
                case additionalProperties
                case associatedErrors
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
