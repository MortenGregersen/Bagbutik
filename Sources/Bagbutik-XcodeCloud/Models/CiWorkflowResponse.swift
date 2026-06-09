import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # CiWorkflowResponse
 The response body for endpoints that create, read, or modify an Xcode Cloud workflow.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowresponse>
 */
public struct CiWorkflowResponse: Codable, Sendable {
    /// The resource data.
    public let data: CiWorkflow
    /// The requested relationship data.
    public var included: [Included]?
    /// The navigational links that include the self-link.
    public let links: DocumentLinks

    public init(data: CiWorkflow,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(CiWorkflow.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }

    public func getMacOsVersion() -> CiMacOsVersion? {
        included?.compactMap { relationship -> CiMacOsVersion? in
            guard case let .ciMacOsVersion(macOsVersion) = relationship else { return nil }
            return macOsVersion
        }.first { $0.id == data.relationships?.macOsVersion?.data?.id }
    }

    public func getProduct() -> CiProduct? {
        included?.compactMap { relationship -> CiProduct? in
            guard case let .ciProduct(product) = relationship else { return nil }
            return product
        }.first { $0.id == data.relationships?.product?.data?.id }
    }

    public func getRepository() -> ScmRepository? {
        included?.compactMap { relationship -> ScmRepository? in
            guard case let .scmRepository(repository) = relationship else { return nil }
            return repository
        }.first { $0.id == data.relationships?.repository?.data?.id }
    }

    public func getXcodeVersion() -> CiXcodeVersion? {
        included?.compactMap { relationship -> CiXcodeVersion? in
            guard case let .ciXcodeVersion(xcodeVersion) = relationship else { return nil }
            return xcodeVersion
        }.first { $0.id == data.relationships?.xcodeVersion?.data?.id }
    }

    public enum Included: Codable, Sendable {
        case ciMacOsVersion(CiMacOsVersion)
        case ciProduct(CiProduct)
        case ciXcodeVersion(CiXcodeVersion)
        case scmRepository(ScmRepository)

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let discriminatorValue = try container.decode(String.self, forKey: "type")
            switch discriminatorValue {
            case "ciMacOsVersions":
                self = .ciMacOsVersion(try CiMacOsVersion(from: decoder))
            case "ciProducts":
                self = .ciProduct(try CiProduct(from: decoder))
            case "ciXcodeVersions":
                self = .ciXcodeVersion(try CiXcodeVersion(from: decoder))
            case "scmRepositories":
                self = .scmRepository(try ScmRepository(from: decoder))
            default:
                throw DecodingError.dataCorruptedError(
                    forKey: "type",
                    in: container,
                    debugDescription: "Unknown Included type '\(discriminatorValue)'")
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .ciMacOsVersion(value):
                try value.encode(to: encoder)
            case let .ciProduct(value):
                try value.encode(to: encoder)
            case let .ciXcodeVersion(value):
                try value.encode(to: encoder)
            case let .scmRepository(value):
                try value.encode(to: encoder)
            }
        }
    }
}
