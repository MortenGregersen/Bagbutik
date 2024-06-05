import Foundation

/**
 # Parameter
 An object that contains the query parameter that produced the error.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/parameter>
 */
public struct Parameter: Codable {
    /// The query parameter that produced the error.
    public var parameter: String?

    public init(parameter: String? = nil) {
        self.parameter = parameter
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        parameter = try container.decodeIfPresent(String.self, forKey: "parameter")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(parameter, forKey: "parameter")
    }
}
