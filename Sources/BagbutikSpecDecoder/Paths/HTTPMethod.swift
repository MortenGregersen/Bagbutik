import Foundation

/**
 HTTP request methods

 Documentation borrowed from:
 <https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods>
 */
public enum HTTPMethod: String {
    /// The GET method requests a representation of the specified resource.
    case get
    /// The PUT method replaces all current representations of the target resource with the request payload.
    case put
    /// The POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server.
    case post
    /// The PATCH method is used to apply partial modifications to a resource.
    case patch
    /// The DELETE method deletes the specified resource.
    case delete
}
