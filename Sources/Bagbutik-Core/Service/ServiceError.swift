import Foundation

/// Errors from the API or from the decoding of the responses.
public enum ServiceError: Error {
    /// Bad Request (HTTP status code 400). The request is invalid and cannot be accepted.
    case badRequest(ErrorResponse)
    /// Unauthorized (HTTP status code 401).
    case unauthorized(ErrorResponse)
    /// Forbidden (HTTP status code 403). The request is not allowed. This can happen if your API key is revoked, your token is incorrectly formatted, or if the requested operation is not allowed.
    case forbidden(ErrorResponse)
    /// Not Found (HTTP status code 404). The request cannot be fulfilled because the resource does not exist.
    case notFound(ErrorResponse)
    /// Conflict (HTTP status code 409). The provided resource data is not valid.
    case conflict(ErrorResponse)
    /// The date in the response has an unknown format.
    case wrongDateFormat(dateString: String)
    /// The error is unhandled HTTP error.
    case unknownHTTPError(statusCode: Int, data: Data)
    /// The error is unknown.
    case unknown(data: Data?)

    /// The associated `ErrorResponse` if the error has one.
    public var errorResponse: ErrorResponse? {
        switch self {
        case .badRequest(let response),
             .unauthorized(let response),
             .forbidden(let response),
             .notFound(let response),
             .conflict(let response):
            return response
        default:
            return nil
        }
    }

    /// A human readable description of the error.
    public var description: String? {
        switch self {
        case .badRequest(let response),
             .unauthorized(let response),
             .forbidden(let response),
             .notFound(let response),
             .conflict(let response):
            return response.errors?.first?.detail
        case .wrongDateFormat(let dateString):
            return "A date in the response has an unknown format. The date: \(dateString)"
        case .unknownHTTPError(let statusCode, let data):
            return "An unhandled HTTP error occurred. Status code \(statusCode). Data as UTF-8 string: \(String(data: data, encoding: .utf8) ?? "Not UTF-8")"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
