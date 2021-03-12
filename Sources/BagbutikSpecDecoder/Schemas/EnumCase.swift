public struct EnumCase: Equatable {
    public let id: String
    public let value: String
    public let documentation: String?

    public init(id: String, value: String, documentation: String? = nil) {
        self.id = id.replacingOccurrences(of: ".", with: "_")
        self.value = value
        self.documentation = documentation?.capitalizingFirstLetter()
    }
}
