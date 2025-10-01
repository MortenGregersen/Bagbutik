import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # BackgroundAssetUploadFileUpdateRequest
 The request body you use to update a background asset upload file.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetuploadfileupdaterequest>
 */
public struct BackgroundAssetUploadFileUpdateRequest: Codable, Sendable, RequestBody {
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
        public var type: String { "backgroundAssetUploadFiles" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var sourceFileChecksum: String? = nil
            public var sourceFileChecksums: Checksums?
            public var uploaded: Bool?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(sourceFileChecksum: String? = nil,
                        sourceFileChecksums: Checksums? = nil,
                        uploaded: Bool? = nil)
            {
                self.sourceFileChecksum = sourceFileChecksum
                self.sourceFileChecksums = sourceFileChecksums
                self.uploaded = uploaded
            }

            public init(sourceFileChecksums: Checksums? = nil,
                        uploaded: Bool? = nil)
            {
                self.sourceFileChecksums = sourceFileChecksums
                self.uploaded = uploaded
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                sourceFileChecksum = try container.decodeIfPresent(String.self, forKey: "sourceFileChecksum")
                sourceFileChecksums = try container.decodeIfPresent(Checksums.self, forKey: "sourceFileChecksums")
                uploaded = try container.decodeIfPresent(Bool.self, forKey: "uploaded")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(sourceFileChecksum, forKey: "sourceFileChecksum")
                try container.encodeIfPresent(sourceFileChecksums, forKey: "sourceFileChecksums")
                try container.encodeIfPresent(uploaded, forKey: "uploaded")
            }
        }
    }
}
