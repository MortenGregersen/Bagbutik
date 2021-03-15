import Foundation

/// An image asset, including its height, width, and template URL.
public struct ImageAsset: Codable {
    public let height: Int?
    public let templateUrl: String?
    public let width: Int?

    public init(height: Int? = nil, templateUrl: String? = nil, width: Int? = nil) {
        self.height = height
        self.templateUrl = templateUrl
        self.width = width
    }
}
