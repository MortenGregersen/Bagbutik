import Foundation

public struct ErrorResponse: Codable {
    public let errors: [Errors]?

    public init(errors: [Errors]? = nil) {
        self.errors = errors
    }

    public struct Errors: Codable {
        public let code: String
        public let detail: String
        public let id: String?
        public let source: Source?
        public let status: String
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

            public struct JsonPointer: Codable {
                public let pointer: String?

                public init(pointer: String? = nil) {
                    self.pointer = pointer
                }
            }

            public struct Parameter: Codable {
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
