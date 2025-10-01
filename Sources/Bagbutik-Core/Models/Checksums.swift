import Foundation

/**
 # Checksums
 The data structure that represents a checksums resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/checksums>
 */
public struct Checksums: Codable, Sendable {
    public var composite: Composite?
    public var file: File?

    public init(composite: Composite? = nil,
                file: File? = nil)
    {
        self.composite = composite
        self.file = file
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        composite = try container.decodeIfPresent(Composite.self, forKey: "composite")
        file = try container.decodeIfPresent(File.self, forKey: "file")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(composite, forKey: "composite")
        try container.encodeIfPresent(file, forKey: "file")
    }

    public struct Composite: Codable, Sendable {
        public var algorithm: Algorithm?
        public var hash: String?

        public init(algorithm: Algorithm? = nil,
                    hash: String? = nil)
        {
            self.algorithm = algorithm
            self.hash = hash
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            algorithm = try container.decodeIfPresent(Algorithm.self, forKey: "algorithm")
            hash = try container.decodeIfPresent(String.self, forKey: "hash")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(algorithm, forKey: "algorithm")
            try container.encodeIfPresent(hash, forKey: "hash")
        }

        public enum Algorithm: String, Sendable, Codable, CaseIterable {
            case MD5

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Algorithm(rawValue: string) {
                    self = value
                } else if let value = Algorithm(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Algorithm value: \(string)"
                    )
                }
            }
        }
    }

    public struct File: Codable, Sendable {
        public var algorithm: ChecksumAlgorithm?
        public var hash: String?

        public init(algorithm: ChecksumAlgorithm? = nil,
                    hash: String? = nil)
        {
            self.algorithm = algorithm
            self.hash = hash
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            algorithm = try container.decodeIfPresent(ChecksumAlgorithm.self, forKey: "algorithm")
            hash = try container.decodeIfPresent(String.self, forKey: "hash")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(algorithm, forKey: "algorithm")
            try container.encodeIfPresent(hash, forKey: "hash")
        }
    }
}
