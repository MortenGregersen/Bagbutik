import Foundation
import Bagbutik_Core

/**
 # AppMediaStateError
 An error code and description.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appmediastateerror>
 */
public struct AppMediaStateError: Codable {
    public var code: String?
    public var description: String?

    public init(code: String? = nil,
                description: String? = nil)
    {
        self.code = code
        self.description = description
    }
}
