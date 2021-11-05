import Foundation

/**
 The data structure that represents a Certificates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificate>
 */
public struct Certificate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "certificates" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe a Certificates resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/certificate/attributes>
     */
    public struct Attributes: Codable {
        public let certificateContent: String?
        public let certificateType: CertificateType?
        public let displayName: String?
        public let expirationDate: Date?
        public let name: String?
        public let platform: BundleIdPlatform?
        public let serialNumber: String?

        public init(certificateContent: String? = nil, certificateType: CertificateType? = nil, displayName: String? = nil, expirationDate: Date? = nil, name: String? = nil, platform: BundleIdPlatform? = nil, serialNumber: String? = nil) {
            self.certificateContent = certificateContent
            self.certificateType = certificateType
            self.displayName = displayName
            self.expirationDate = expirationDate
            self.name = name
            self.platform = platform
            self.serialNumber = serialNumber
        }
    }
}
