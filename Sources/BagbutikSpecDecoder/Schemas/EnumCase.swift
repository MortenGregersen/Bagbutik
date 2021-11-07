/// A case for an enum
public struct EnumCase: Equatable {
    /// The name of the case
    public let id: String
    /// The value of the case
    public let value: String
    /// Tells if the case is deprecated
    public let deprecated: Bool
    /// The documentation for the case - if any
    public let documentation: String?

    /**
     Initialize a new case
     
     - Parameters:
        - id: The name of the case
        - value: The value of the case
        - documentation: The documentation for the case
     */
    public init(id: String, value: String, deprecated: Bool = false, documentation: String? = nil) {
        self.id = id.replacingOccurrences(of: ".", with: "_")
        self.value = value
        self.deprecated = deprecated
        self.documentation = documentation?.capitalizingFirstLetter()
    }
}
