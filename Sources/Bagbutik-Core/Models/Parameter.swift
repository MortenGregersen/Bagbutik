import Foundation

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
