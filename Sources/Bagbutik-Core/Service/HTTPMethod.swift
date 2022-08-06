import Foundation

/**
 HTTP request methods

 Documentation borrowed from:
 <https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods>
 */
public enum HTTPMethod: String {
    /// The GET method requests a representation of the specified resource.
    case get = "GET"
    /// The PUT method replaces all current representations of the target resource with the request payload.
    case put = "PUT"
    /// The POST method is used to submit an entity to the specified resource, often causing a change in state or side effects on the server.
    case post = "POST"
    /// The PATCH method is used to apply partial modifications to a resource.
    case patch = "PATCH"
    /// The DELETE method deletes the specified resource.
    case delete = "DELETE"
}
