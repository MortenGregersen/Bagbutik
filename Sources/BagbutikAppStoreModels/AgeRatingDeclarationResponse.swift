import BagbutikCore
import Foundation

/**
 # AgeRatingDeclarationResponse

 A response containing a single age rating declaration with your app’s content descriptors.

 ```
 object AgeRatingDeclarationResponse
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationresponse>
 */
public struct AgeRatingDeclarationResponse: Codable, Sendable {
    public let data: AgeRatingDeclaration
    public let links: DocumentLinks

    public init(data: AgeRatingDeclaration,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(AgeRatingDeclaration.self, forKey: "data")
        links = try container.decode(DocumentLinks.self, forKey: "links")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encode(links, forKey: "links")
    }
}
