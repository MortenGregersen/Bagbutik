import Foundation

public struct AppMediaStateError: Codable {
    public let code: String?
    public let description: String?

    public init(code: String? = nil, description: String? = nil) {
        self.code = code
        self.description = description
    }
}
