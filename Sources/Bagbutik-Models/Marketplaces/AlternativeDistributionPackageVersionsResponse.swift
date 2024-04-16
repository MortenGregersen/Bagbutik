import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVersionsResponse
 A response that contains a list of alternative distribution package version resources.

 This object is the response that contains a list of alternative distribution package versions. For more information, see [Read version information for an alternative distribution package](https://developer.apple.com/documentation/appstoreconnectapi/read_version_information_for_an_alternative_distribution_package). The schema of the response body is below.
 ```
 {
 ```

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackageversionsresponse>
 */
public struct AlternativeDistributionPackageVersionsResponse: Codable, PagedResponse {
    public typealias Data = AlternativeDistributionPackageVersion

    public let data: [AlternativeDistributionPackageVersion]
    public var included: [Included]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [AlternativeDistributionPackageVersion],
                included: [Included]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public func getAlternativeDistributionPackage(for alternativeDistributionPackageVersion: AlternativeDistributionPackageVersion) -> AlternativeDistributionPackage? {
        included?.compactMap { relationship -> AlternativeDistributionPackage? in
            guard case let .alternativeDistributionPackage(alternativeDistributionPackage) = relationship else { return nil }
            return alternativeDistributionPackage
        }.first { $0.id == alternativeDistributionPackageVersion.relationships?.alternativeDistributionPackage?.data?.id }
    }

    public func getDeltas(for alternativeDistributionPackageVersion: AlternativeDistributionPackageVersion) -> [AlternativeDistributionPackageDelta] {
        guard let deltaIds = alternativeDistributionPackageVersion.relationships?.deltas?.data?.map(\.id),
              let deltas = included?.compactMap({ relationship -> AlternativeDistributionPackageDelta? in
                  guard case let .alternativeDistributionPackageDelta(delta) = relationship else { return nil }
                  return deltaIds.contains(delta.id) ? delta : nil
              })
        else {
            return []
        }
        return deltas
    }

    public func getVariants(for alternativeDistributionPackageVersion: AlternativeDistributionPackageVersion) -> [AlternativeDistributionPackageVariant] {
        guard let variantIds = alternativeDistributionPackageVersion.relationships?.variants?.data?.map(\.id),
              let variants = included?.compactMap({ relationship -> AlternativeDistributionPackageVariant? in
                  guard case let .alternativeDistributionPackageVariant(variant) = relationship else { return nil }
                  return variantIds.contains(variant.id) ? variant : nil
              })
        else {
            return []
        }
        return variants
    }

    public enum Included: Codable {
        case alternativeDistributionPackage(AlternativeDistributionPackage)
        case alternativeDistributionPackageDelta(AlternativeDistributionPackageDelta)
        case alternativeDistributionPackageVariant(AlternativeDistributionPackageVariant)

        public init(from decoder: Decoder) throws {
            if let alternativeDistributionPackage = try? AlternativeDistributionPackage(from: decoder) {
                self = .alternativeDistributionPackage(alternativeDistributionPackage)
            } else if let alternativeDistributionPackageDelta = try? AlternativeDistributionPackageDelta(from: decoder) {
                self = .alternativeDistributionPackageDelta(alternativeDistributionPackageDelta)
            } else if let alternativeDistributionPackageVariant = try? AlternativeDistributionPackageVariant(from: decoder) {
                self = .alternativeDistributionPackageVariant(alternativeDistributionPackageVariant)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .alternativeDistributionPackage(value):
                try value.encode(to: encoder)
            case let .alternativeDistributionPackageDelta(value):
                try value.encode(to: encoder)
            case let .alternativeDistributionPackageVariant(value):
                try value.encode(to: encoder)
            }
        }

        private enum CodingKeys: String, CodingKey {
            case type
        }
    }
}
