import Foundation

public extension Schema {
    struct Documentation: Equatable {
        let summary: String
        let properties: [String: String]?

        init(summary: String, properties: [String: String]? = nil) {
            self.summary = summary
            self.properties = properties
        }

        static let allDocumentation: [String: Documentation] = [:]
    }
}
