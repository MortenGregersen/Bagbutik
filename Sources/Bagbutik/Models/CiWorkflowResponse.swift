import Foundation

/**
 # CiWorkflowResponse
 A response that contains a single Workflows resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ciworkflowresponse>
 */
public struct CiWorkflowResponse: Codable {
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

    public enum Included: Codable {
        case ciMacOsVersion(CiMacOsVersion)
        case ciProduct(CiProduct)
        case ciXcodeVersion(CiXcodeVersion)
        case scmRepository(ScmRepository)

        public init(from decoder: Decoder) throws {
            if let ciMacOsVersion = try? CiMacOsVersion(from: decoder) {
                self = .ciMacOsVersion(ciMacOsVersion)
            } else if let ciProduct = try? CiProduct(from: decoder) {
                self = .ciProduct(ciProduct)
            } else if let ciXcodeVersion = try? CiXcodeVersion(from: decoder) {
                self = .ciXcodeVersion(ciXcodeVersion)
            } else if let scmRepository = try? ScmRepository(from: decoder) {
                self = .scmRepository(scmRepository)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
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

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
