public struct EnumCase {
    public let id: String
    public let value: String
    public let description: String?

    public init(id: String, value: String, description: String? = nil) {
        self.id = id.replacingOccurrences(of: ".", with: "_")
        self.value = value
        self.description = description?.capitalizingFirstLetter()
    }
}
