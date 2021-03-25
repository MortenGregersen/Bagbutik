/// A case for an enum
public struct EnumCase: Equatable {
    /// The name of the case
    public let id: String
    /// The value of the case
    public let value: String
    /// The documentation for the case - if any
    public let documentation: String?

    /**
     Initialize a new case
     
     - Parameter id: The name of the case
     - Parameter value: The value of the case
     - Parameter documentation: The documentation for the case
     */
    public init(id: String, value: String, documentation: String? = nil) {
        self.id = id.replacingOccurrences(of: ".", with: "_")
        self.value = value
        self.documentation = documentation?.capitalizingFirstLetter()
    }
}
