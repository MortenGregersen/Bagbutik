import Foundation

/**
 # ImageAsset
 An image asset, including its height, width, and template URL.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/imageasset>
 */
public struct ImageAsset: Codable {
    public var height: Int?
    public var templateUrl: String?
    public var width: Int?

    public init(height: Int? = nil,
                templateUrl: String? = nil,
                width: Int? = nil)
    {
        self.height = height
        self.templateUrl = templateUrl
        self.width = width
    }
}
