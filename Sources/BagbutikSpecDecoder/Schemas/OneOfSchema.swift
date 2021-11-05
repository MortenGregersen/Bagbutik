import Foundation

/// A reprensetation of an enum with cases with associated values
public struct OneOfSchema: Decodable, Equatable {
    /// The options/cases of the schema
    public var options: [OneOfOption]
}
