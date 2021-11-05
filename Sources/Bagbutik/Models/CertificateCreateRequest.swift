import Foundation

/**
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

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "certificates" }
        /// The resource's attributes.
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/certificatecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let certificateType: CertificateType
            public let csrContent: String

            public init(certificateType: CertificateType, csrContent: String) {
                self.certificateType = certificateType
                self.csrContent = csrContent
            }
        }
    }
}
