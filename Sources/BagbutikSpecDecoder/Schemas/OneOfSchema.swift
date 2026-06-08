import Foundation

/// A reprensetation of an enum with cases with associated values
public struct OneOfSchema: Decodable, Equatable, Sendable {
    /// The options/cases of the schema
    public var options: [OneOfOption]
    /// The discriminator used to select an option when decoding
    public var discriminator: Discriminator?
    /// Additional protocols the enum should have when rendered
    public var additionalProtocols: Set<String>
    
    /**
     Initialize an enum with cases with associated values

     - Parameters:
        - options: The options/cases of the schema
        - discriminator: The discriminator used to select an option when decoding
        - additionalProtocols: Additional protocols the enum should have when rendered
     */
    init(options: [OneOfOption], discriminator: Discriminator? = nil, additionalProtocols: [String] = []) {
        self.options = options.reduce(into: [OneOfOption]()) { uniqueOptions, option in
            if !uniqueOptions.contains(option) {
                uniqueOptions.append(option)
            }
        }
        self.discriminator = discriminator
        self.additionalProtocols = Set(additionalProtocols)
    }

    private enum CodingKeys: String, CodingKey {
        case oneOf
        case discriminator
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let options = try container.decode([OneOfOption].self, forKey: .oneOf)
        let discriminator = try container.decodeIfPresent(Discriminator.self, forKey: .discriminator)
        self.init(options: options, discriminator: discriminator)
    }
}

/// A discriminator for selecting an option from a one of schema
public struct Discriminator: Decodable, Equatable, Sendable {
    /// The name of the property which holds the discriminator value
    public let propertyName: String
    /// A mapping from discriminator values to schema references
    public let mapping: [String: String]

    public init(propertyName: String, mapping: [String: String]) {
        self.propertyName = propertyName
        self.mapping = mapping
    }
}
