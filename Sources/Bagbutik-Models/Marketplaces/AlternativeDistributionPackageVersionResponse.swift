import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVersionResponse
 A response that contains a single alternative distribution package version resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackageversionresponse>
 */
public struct AlternativeDistributionPackageVersionResponse: Codable {
    public let data: AlternativeDistributionPackageVersion
    public var included: [Included]?
    public let links: DocumentLinks

    public init(data: AlternativeDistributionPackageVersion,
                included: [Included]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public func getAlternativeDistributionPackage() -> AlternativeDistributionPackage? {
        included?.compactMap { relationship -> AlternativeDistributionPackage? in
            guard case let .alternativeDistributionPackage(alternativeDistributionPackage) = relationship else { return nil }
            return alternativeDistributionPackage
        }.first { $0.id == data.relationships?.alternativeDistributionPackage?.data?.id }
    }

    public func getDeltas() -> [AlternativeDistributionPackageDelta] {
        guard let deltaIds = data.relationships?.deltas?.data?.map(\.id),
              let deltas = included?.compactMap({ relationship -> AlternativeDistributionPackageDelta? in
                  guard case let .alternativeDistributionPackageDelta(delta) = relationship else { return nil }
                  return deltaIds.contains(delta.id) ? delta : nil
              })
        else {
            return []
        }
        return deltas
    }

    public func getVariants() -> [AlternativeDistributionPackageVariant] {
        guard let variantIds = data.relationships?.variants?.data?.map(\.id),
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
