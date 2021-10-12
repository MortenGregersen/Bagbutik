import Combine
import Crypto
import Foundation

public protocol BagbutikServiceProtocol {
    func request<T: Decodable>(_ request: Request<T, ErrorResponse>) async throws -> T
    func requestAllPages<T: Decodable & PagedResponse>(_ request: Request<T, ErrorResponse>) async throws -> (responses: [T], data: [T.Data])
    func requestNextPage<T: Decodable & PagedResponse>(for response: T) async throws -> T?
    func requestAllPages<T: Decodable & PagedResponse>(for response: T) async throws -> (responses: [T], data: [T.Data])
}

public class BagbutikService: BagbutikServiceProtocol {
    private var jwt: JWT
    
    public init(jwt: JWT) {
        self.jwt = jwt
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
        /// The date in the response has an unknown format.
        case wrongDateFormat(dateString: String)
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
            case .wrongDateFormat(let dateString):
                return "A date in the response has an unknown format. The date: \(dateString)"
            case .unknownHTTPError(let statusCode, let data):
                return "An unhandled HTTP error occurred. Status code \(statusCode). Data as UTF-8 string: \(String(data: data, encoding: .utf8) ?? "Not UTF-8")"
            case .unknown:
                return "An unknown error occurred."
            }
        }
    }
    
    private static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = dateFormatter.date(from: dateString, inFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX") {
                return date
            }
            if let date = dateFormatter.date(from: dateString, inFormat: "yyyy-MM-dd'T'HH:mm:ssXXXXX") {
                return date
            }
            if let date = dateFormatter.date(from: dateString, inFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ") {
                return date
            }
            throw ServiceError.wrongDateFormat(dateString: dateString)
        }
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
        return (responses: responses, data: responses.flatMap { $0.data })
    }
    
    private func fetch<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        var urlRequest = urlRequest
        if jwt.isExpired {
            try jwt.renewEncodedSignature()
        }
        urlRequest.addJWTAuthorizationHeader(jwt.encodedSignature)
        let dataAndResponse = try await URLSession.shared.data(for: urlRequest)
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
                    print(errorResponse)
                }
            }
            throw ServiceError.unknownHTTPError(statusCode: httpResponse.statusCode, data: data)
        }
        throw ServiceError.unknown(data: data)
    }
}

private extension DateFormatter {
    func date(from string: String, inFormat format: String) -> Date? {
        dateFormat = format
        return date(from: string)
    }
}
