import BagbutikCore
import Foundation

/**
 # AppAssetLibraryRefDatumResponse

 The response body for endpoints that read an app asset library reference data resource.

 ```
 object AppAssetLibraryRefDatumResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryrefdatumresponse>
 */
public struct AppAssetLibraryRefDatumResponse: Codable, Sendable {
    public let data: AppAssetLibraryRefDatum
    public let links: DocumentLinks

    public init(data: AppAssetLibraryRefDatum,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppAssetLibraryRefDatum.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
