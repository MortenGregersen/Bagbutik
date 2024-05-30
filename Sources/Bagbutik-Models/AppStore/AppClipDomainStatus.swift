import Bagbutik_Core
import Foundation

/**
 # AppClipDomainStatus
 The data structure that represents the App Clip Domain Statuses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatus>
 */
public struct AppClipDomainStatus: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an App Clip Domain Statuses resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipDomainStatuses" }
    /// The attributes that describe the App Clip Domain Statuses resource.
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # AppClipDomainStatus.Attributes
     The attributes that describe the App Clip Domain Status resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatus/attributes>
     */
    public struct Attributes: Codable {
        /// An array of domains you associated with your app or App Clip.
        public var domains: [Domains]?
        /// The date when App Store Connect last verified the status of an associated domain.
        public var lastUpdatedDate: Date?

        public init(domains: [Domains]? = nil,
                    lastUpdatedDate: Date? = nil)
        {
            self.domains = domains
            self.lastUpdatedDate = lastUpdatedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            domains = try container.decodeIfPresent([Domains].self, forKey: .domains)
            lastUpdatedDate = try container.decodeIfPresent(Date.self, forKey: .lastUpdatedDate)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(domains, forKey: .domains)
            try container.encodeIfPresent(lastUpdatedDate, forKey: .lastUpdatedDate)
        }

        private enum CodingKeys: String, CodingKey {
            case domains
            case lastUpdatedDate
        }

        /**
         # AppClipDomainStatus.Attributes.Domains
         Domains you associated with your App Clip.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatus/attributes/domains>
         */
        public struct Domains: Codable {
            /// A domain you associated with your app or App Clip.
            public var domain: String?
            /// A string that describes an issue that occurred when App Store Connect tried to validate the status of an associated domain.
            public var errorCode: ErrorCode?
            /// A Boolean value that indicates whether App Store Connect was able to verify the configuration of the associated domain.
            public var isValid: Bool?
            /// The date when App Store Connect last verified the status of an associated domain.
            public var lastUpdatedDate: Date?

            public init(domain: String? = nil,
                        errorCode: ErrorCode? = nil,
                        isValid: Bool? = nil,
                        lastUpdatedDate: Date? = nil)
            {
                self.domain = domain
                self.errorCode = errorCode
                self.isValid = isValid
                self.lastUpdatedDate = lastUpdatedDate
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                domain = try container.decodeIfPresent(String.self, forKey: .domain)
                errorCode = try container.decodeIfPresent(ErrorCode.self, forKey: .errorCode)
                isValid = try container.decodeIfPresent(Bool.self, forKey: .isValid)
                lastUpdatedDate = try container.decodeIfPresent(Date.self, forKey: .lastUpdatedDate)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(domain, forKey: .domain)
                try container.encodeIfPresent(errorCode, forKey: .errorCode)
                try container.encodeIfPresent(isValid, forKey: .isValid)
                try container.encodeIfPresent(lastUpdatedDate, forKey: .lastUpdatedDate)
            }

            private enum CodingKeys: String, CodingKey {
                case domain
                case errorCode
                case isValid
                case lastUpdatedDate
            }

            public enum ErrorCode: String, Codable, CaseIterable {
                case badHttpResponse = "BAD_HTTP_RESPONSE"
                case badJsonContent = "BAD_JSON_CONTENT"
                case badPkcs7Signature = "BAD_PKCS7_SIGNATURE"
                case cannotReachAasaFile = "CANNOT_REACH_AASA_FILE"
                case dnsError = "DNS_ERROR"
                case insecureRedirectsForbidden = "INSECURE_REDIRECTS_FORBIDDEN"
                case invalidEntitlementMissingSection = "INVALID_ENTITLEMENT_MISSING_SECTION"
                case invalidEntitlementSyntaxError = "INVALID_ENTITLEMENT_SYNTAX_ERROR"
                case invalidEntitlementUnhandledSection = "INVALID_ENTITLEMENT_UNHANDLED_SECTION"
                case invalidEntitlementUnknownId = "INVALID_ENTITLEMENT_UNKNOWN_ID"
                case networkError = "NETWORK_ERROR"
                case networkErrorTemporary = "NETWORK_ERROR_TEMPORARY"
                case otherError = "OTHER_ERROR"
                case timeout = "TIMEOUT"
                case tlsError = "TLS_ERROR"
                case unexpectedError = "UNEXPECTED_ERROR"
            }
        }
    }
}
