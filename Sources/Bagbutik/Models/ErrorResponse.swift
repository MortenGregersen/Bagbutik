import Foundation

/// Information with error details that an API returns in the response body whenever the API request is not successful.
public struct ErrorResponse: Codable {
    /// An array of one or more errors.
    public let errors: [Errors]?

    public init(errors: [Errors]? = nil) {
        self.errors = errors
    }

    /// The details about one error that is returned when an API request is not successful.
    public struct Errors: Codable {
        /// A machine-readable code indicating the type of error. The code is a hierarchical value with levels of specificity separated by the '.' character. This value is parseable for programmatic error handling in code.
        public let code: String
        /// A detailed explanation of the error. Do not use this field for programmatic error handling.
        public let detail: String
        /// The unique ID of a specific instance of an error, request, and response. Use this ID when providing feedback to or debugging issues with Apple.
        public let id: String?
        /// One of two possible types of values: source.parameter, provided when a query parameter produced the error, or source.JsonPointer, provided when a problem with the entity produced the error.
        public let source: Source?
        /// The HTTP status code of the error. This status code usually matches the response's status code; however, if the request produces multiple errors, these two codes may differ.
        public let status: String
        /// A summary of the error. Do not use this field for programmatic error handling.
        public let title: String

        public init(code: String, detail: String, id: String? = nil, source: Source? = nil, status: String, title: String) {
            self.code = code
            self.detail = detail
            self.id = id
            self.source = source
            self.status = status
            self.title = title
        }

        public enum Source: Codable {
            case jsonPointer(JsonPointer)
            case parameter(Parameter)

            /// An object that contains the JSON pointer that indicates the location of the error.
            public struct JsonPointer: Codable {
                /// A JSON pointer that indicates the location in the request entity where the error originates.
                public let pointer: String?

                public init(pointer: String? = nil) {
                    self.pointer = pointer
                }
            }

            /// An object that contains the query parameter that produced the error.
            public struct Parameter: Codable {
                /// The query parameter that produced the error.
                public let parameter: String?

                public init(parameter: String? = nil) {
                    self.parameter = parameter
                }
            }

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

            private enum TypeKeys: String, Codable {
                case jsonPointer
                case parameter
            }
        }
    }
}
