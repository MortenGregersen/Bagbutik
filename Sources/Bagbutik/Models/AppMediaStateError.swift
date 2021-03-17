import Foundation

/**
 An error code and description.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appmediastateerror>
 */
public struct AppMediaStateError: Codable {
    public let code: String?
    public let description: String?

    public init(code: String? = nil, description: String? = nil) {
        self.code = code
        self.description = description
    }
}
