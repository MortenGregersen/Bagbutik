import Bagbutik_Core
import Foundation

/**
 # AppClipDomainStatus
 The data structure that represents the App Clip Domain Statuses resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipdomainstatus>
 */
public struct AppClipDomainStatus: Codable, Sendable, Identifiable {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var domains: [Domains]?
        public var lastUpdatedDate: Date?

        public init(domains: [Domains]? = nil,
                    lastUpdatedDate: Date? = nil)
        {
            self.domains = domains
            self.lastUpdatedDate = lastUpdatedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            domains = try container.decodeIfPresent([Domains].self, forKey: "domains")
            lastUpdatedDate = try container.decodeIfPresent(Date.self, forKey: "lastUpdatedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(domains, forKey: "domains")
            try container.encodeIfPresent(lastUpdatedDate, forKey: "lastUpdatedDate")
        }

        public struct Domains: Codable, Sendable {
            public var domain: String?
            public var errorCode: ErrorCode?
            public var isValid: Bool?
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
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                domain = try container.decodeIfPresent(String.self, forKey: "domain")
                errorCode = try container.decodeIfPresent(ErrorCode.self, forKey: "errorCode")
                isValid = try container.decodeIfPresent(Bool.self, forKey: "isValid")
                lastUpdatedDate = try container.decodeIfPresent(Date.self, forKey: "lastUpdatedDate")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(domain, forKey: "domain")
                try container.encodeIfPresent(errorCode, forKey: "errorCode")
                try container.encodeIfPresent(isValid, forKey: "isValid")
                try container.encodeIfPresent(lastUpdatedDate, forKey: "lastUpdatedDate")
            }

            public enum ErrorCode: String, Sendable, Codable, CaseIterable {
                case badHttpResponse = "BAD_HTTP_RESPONSE"
                case badJsonContent = "BAD_JSON_CONTENT"
                case badPkcs7Signature = "BAD_PKCS7_SIGNATURE"
                case cannotReachAasaFile = "CANNOT_REACH_AASA_FILE"
                case crossSiteRedirectsForbidden = "CROSS_SITE_REDIRECTS_FORBIDDEN"
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
                case tooManyRedirects = "TOO_MANY_REDIRECTS"
                case unexpectedError = "UNEXPECTED_ERROR"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = ErrorCode(rawValue: string) {
                        self = value
                    } else if let value = ErrorCode(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid ErrorCode value: \(string)"
                        )
                    }
                }
            }
        }
    }
}
