import Foundation

public struct AppPriceInlineCreate: Codable {
    public let id: String?
    public var type: String { "appPrices" }

    public init(id: String? = nil) {
        self.id = id
    }
}
