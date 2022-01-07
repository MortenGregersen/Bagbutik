import Foundation

public struct HttpHeader: Codable {
    @NullCodable public var name: String?
    @NullCodable public var value: String?

    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}
