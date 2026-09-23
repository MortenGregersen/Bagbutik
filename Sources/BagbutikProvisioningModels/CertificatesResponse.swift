import BagbutikCore
import Foundation

/**
 # CertificatesResponse

 The response body for endpoints that list signing certificates.

 ```
 object CertificatesResponse
 ```

 ## See Also

 [`List and download certificates`](https://developer.apple.com/documentation/AppStoreConnectAPI/GET-v1-certificates)

 Find and list certificates and download their data.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificatesresponse>
 */
public struct CertificatesResponse: Codable, Sendable, PagedResponse {
    public typealias Data = Certificate

    public let data: [Certificate]
    public var included: [PassTypeId]?
    public let links: PagedDocumentLinks
    public var meta: PagingInformation?

    public init(data: [Certificate],
                included: [PassTypeId]? = nil,
                links: PagedDocumentLinks,
                meta: PagingInformation? = nil)
    {
        self.data = data
        self.included = included
        self.links = links
        self.meta = meta
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode([Certificate].self, forKey: "data")
        included = try container.decodeIfPresent([PassTypeId].self, forKey: "included")
        links = try container.decode(PagedDocumentLinks.self, forKey: "links")
        meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
        try container.encodeIfPresent(meta, forKey: "meta")
    }

    public func getPassTypeId(for certificate: Certificate) -> PassTypeId? {
        included?.first { $0.id == certificate.relationships?.passTypeId?.data?.id }
    }
}
