import Foundation

public struct HttpHeader: Codable {
    public var name: String?
    public var value: String?

    public init(name: String? = nil, value: String? = nil) {
        self.name = name
        self.value = value
    }
}
