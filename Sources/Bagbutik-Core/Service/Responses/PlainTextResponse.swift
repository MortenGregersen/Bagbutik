import Foundation

/// A response with plain text.
public protocol PlainTextResponse: Decodable {
    /// The plain text.
    var text: String { get }

    /**
     Create a new instance with the plain text.

     - Parameters:
        - text: The plain text for the response.
     */
    static func from(text: String) -> Self
}
