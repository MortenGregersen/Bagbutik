import BagbutikCore
import Foundation

/**
 # AppAssetLibraryVideoResponse

 The response body for endpoints that create, read, or modify an app asset library video.

 ```
 object AppAssetLibraryVideoResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appassetlibraryvideoresponse>
 */
public struct AppAssetLibraryVideoResponse: Codable, Sendable {
    public let data: AppAssetLibraryVideo
    public var included: [AppAssetLibraryPlacement]?
    public let links: DocumentLinks

    public init(data: AppAssetLibraryVideo,
                included: [AppAssetLibraryPlacement]? = nil,
                links: DocumentLinks)
    {
        self.data = data
        self.included = included
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AppAssetLibraryVideo.self, forKey: "data")
        included = try container.decodeIfPresent([AppAssetLibraryPlacement].self, forKey: "included")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
        try container.encode(links, forKey: "links")
    }
}
