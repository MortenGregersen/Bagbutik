import Combine
import Crypto
import Foundation

public protocol BagbutikServiceProtocol {
    func request<T: Decodable>(_ request: Request<T, ErrorResponse>) async throws -> T
    func requestAllPages<T: Decodable & PagedResponse>(_ request: Request<T, ErrorResponse>) async throws -> (responses: [T], data: [T.Data])
    func requestNextPage<T: Decodable & PagedResponse>(for response: T) async throws -> T?
    func requestAllPages<T: Decodable & PagedResponse>(for response: T) async throws -> (responses: [T], data: [T.Data])
}

public protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

public class BagbutikService: BagbutikServiceProtocol {
    private var jwt: JWT
    private let urlSession: URLSessionProtocol
    
    public init(jwt: JWT, urlSession: URLSessionProtocol = URLSession.shared) {
        self.jwt = jwt
        self.urlSession = urlSession
    }
    
    private static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    public func request<T: Decodable>(_ request: Request<T, ErrorResponse>) async throws -> T {
        let urlRequest = request.asUrlRequest()
        return try await fetch(urlRequest)
    }
    
    public func requestAllPages<T: Decodable & PagedResponse>(_ request: Request<T, ErrorResponse>) async throws -> (responses: [T], data: [T.Data]) {
        let response = try await self.request(request)
        return try await requestAllPages(for: response)
    }
    
    public func requestNextPage<T: Decodable & PagedResponse>(for response: T) async throws -> T? {
        guard let urlString = response.links.next, let url = URL(string: urlString) else { return nil }
        let urlRequest = URLRequest(url: url)
        return try await fetch(urlRequest)
    }
    
    public func requestAllPages<T: Decodable & PagedResponse>(for response: T) async throws -> (responses: [T], data: [T.Data]) {
        var responses = [response]
        while let nextResponse = try await requestNextPage(for: responses.last!) {
            responses.append(nextResponse)
        }
        return (responses: responses, data: responses.flatMap(\.data))
    }
    
    private func fetch<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        var urlRequest = urlRequest
        if jwt.isExpired {
            try jwt.renewEncodedSignature()
        }
        urlRequest.addJWTAuthorizationHeader(jwt.encodedSignature)
        let dataAndResponse = try await urlSession.data(for: urlRequest, delegate: nil)
        return try Self.decodeResponse(data: dataAndResponse.0, response: dataAndResponse.1) as T
    }
    
    private static func decodeResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        if let httpResponse = response as? HTTPURLResponse {
            if (200 ... 300).contains(httpResponse.statusCode) {
                if T.self == GzipResponse.self {
                    return try GzipResponse(data: data) as! T
                } else if T.self == EmptyResponse.self {
                    return EmptyResponse() as! T
                }
                return try Self.jsonDecoder.decode(T.self, from: data)
            } else if let errorResponse = try? Self.jsonDecoder.decode(ErrorResponse.self, from: data) {
                switch httpResponse.statusCode {
                case 400:
                    throw ServiceError.badRequest(errorResponse)
                case 401:
                    throw ServiceError.unauthorized(errorResponse)
                case 403:
                    throw ServiceError.forbidden(errorResponse)
                case 404:
                    throw ServiceError.notFound(errorResponse)
                case 409:
                    throw ServiceError.conflict(errorResponse)
                default:
                    break
                }
            }
            throw ServiceError.unknownHTTPError(statusCode: httpResponse.statusCode, data: data)
        }
        throw ServiceError.unknown(data: data)
    }
}

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
    /// The error is unhandled HTTP error.
    case unknownHTTPError(statusCode: Int, data: Data)
    /// The error is unknown.
    case unknown(data: Data?)
    
    /// A human readable description of the error.
    public var description: String? {
        switch self {
        case .badRequest(let response),
             .unauthorized(let response),
             .forbidden(let response),
             .notFound(let response),
             .conflict(let response):
            return response.errors?.first?.detail
        case .unknownHTTPError(let statusCode, let data):
            return "An unhandled HTTP error occurred. Status code \(statusCode). Data as UTF-8 string: \(String(data: data, encoding: .utf8) ?? "Not UTF-8")"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
