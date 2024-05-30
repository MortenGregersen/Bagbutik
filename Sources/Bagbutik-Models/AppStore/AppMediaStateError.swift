import Bagbutik_Core
import Foundation

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

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        description = try container.decodeIfPresent(String.self, forKey: .description)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(description, forKey: .description)
    }

    private enum CodingKeys: String, CodingKey {
        case code
        case description
    }
}
