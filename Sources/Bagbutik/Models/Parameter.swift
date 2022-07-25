import Foundation

/**
 An object that contains the query parameter that produced the error.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/parameter>
 */
public struct Parameter: Codable {
    /// The query parameter that produced the error.
    public var parameter: String?

    public init(parameter: String? = nil) {
        self.parameter = parameter
    }
}
