import Foundation

/// A reprensetation of an enum with cases with associated values
public struct OneOfSchema: Decodable, Equatable, Sendable {
    /// The options/cases of the schema
    public var options: [OneOfOption]
    /// Additional protocols the enum should have when rendered
    public var additionalProtocols: Set<String>
    
    /**
     Initialize an enum with cases with associated values

     - Parameters:
        - options: The options/cases of the schema
        - additionalProtocols: Additional protocols the enum should have when rendered
     */
    init(options: [OneOfOption], additionalProtocols: [String] = []) {
        self.options = options
        self.additionalProtocols = Set(additionalProtocols)
    }
}
