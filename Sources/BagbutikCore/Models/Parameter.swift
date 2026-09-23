import Foundation

/**
 # Parameter

 An object that contains the query parameter that produced the error.

 ```
 object Parameter
 ```

 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/parameter>
 */
public struct Parameter: Codable, Sendable {
    public let parameter: String

    public init(parameter: String) {
        self.parameter = parameter
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        parameter = try container.decode(String.self, forKey: "parameter")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(parameter, forKey: "parameter")
    }
}
