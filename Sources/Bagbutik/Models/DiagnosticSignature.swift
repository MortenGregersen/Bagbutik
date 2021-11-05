import Foundation

/**
 The data structure that represents the Diagnostic Signatures resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticsignature>
 */
public struct DiagnosticSignature: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "diagnosticSignatures" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    /**
     Attributes that describe a Diagnostic Signatures resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/diagnosticsignature/attributes>
     */
    public struct Attributes: Codable {
        public let diagnosticType: DiagnosticType?
        public let signature: String?
        public let weight: Double?

        public init(diagnosticType: DiagnosticType? = nil, signature: String? = nil, weight: Double? = nil) {
            self.diagnosticType = diagnosticType
            self.signature = signature
            self.weight = weight
        }

        public enum DiagnosticType: String, Codable, CaseIterable {
            case diskWrites = "DISK_WRITES"
        }
    }
}
