import Foundation

/**
 An image asset, including its height, width, and template URL.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/imageasset>
 */
public struct ImageAsset: Codable {
    @NullCodable public var height: Int?
    @NullCodable public var templateUrl: String?
    @NullCodable public var width: Int?

    public init(height: Int? = nil, templateUrl: String? = nil, width: Int? = nil) {
        self.height = height
        self.templateUrl = templateUrl
        self.width = width
    }
}
