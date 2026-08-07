import Foundation

/// A response type that is initialized directly from plain text instead of JSON.
public protocol PlainTextResponse: Decodable {
    /// The plain text.
    var text: String { get }

    /**
     Creates a response from the plain text returned by the server.

     - Parameters:
        - text: The plain text for the response.
     */
    static func from(text: String) -> Self
}
