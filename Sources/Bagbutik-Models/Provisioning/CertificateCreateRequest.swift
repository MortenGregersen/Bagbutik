import Bagbutik_Core
import Foundation

/**
 # CertificateCreateRequest
 The request body you use to create a Certificate.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest>
 */
public struct CertificateCreateRequest: Codable, RequestBody {
    /// The resource data.
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

    /**
     # CertificateCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "certificates" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
        }

        /**
         # CertificateCreateRequest.Data.Attributes
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let certificateType: CertificateType
            public let csrContent: String

            public init(certificateType: CertificateType,
                        csrContent: String)
            {
                self.certificateType = certificateType
                self.csrContent = csrContent
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                certificateType = try container.decode(CertificateType.self, forKey: "certificateType")
                csrContent = try container.decode(String.self, forKey: "csrContent")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(certificateType, forKey: "certificateType")
                try container.encode(csrContent, forKey: "csrContent")
            }
        }
    }
}
