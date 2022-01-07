import Foundation

/**
 An error code and description.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appmediastateerror>
 */
public struct AppMediaStateError: Codable {
    @NullCodable public var code: String?
    @NullCodable public var description: String?

    public init(code: String? = nil, description: String? = nil) {
        self.code = code
        self.description = description
    }
}
