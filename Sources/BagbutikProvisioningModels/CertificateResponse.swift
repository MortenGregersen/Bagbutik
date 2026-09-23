import BagbutikCore
import Foundation

/**
 # CertificateResponse

 The response body for endpoints that create or read a single signing certificate.

 ```
 object CertificateResponse
 ```

 ## See Also

 [`Create a certificate`](https://developer.apple.com/documentation/AppStoreConnectAPI/POST-v1-certificates)

 Create a new certificate using a certificate signing request.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificateresponse>
 */
public struct CertificateResponse: Codable, Sendable {
    public let data: Certificate
    public var included: [PassTypeId]?
    public let links: DocumentLinks

    public init(data: Certificate,
                included: [PassTypeId]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Certificate.self, forKey: "data")
        included = try container.decodeIfPresent([PassTypeId].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
