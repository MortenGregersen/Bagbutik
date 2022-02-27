import Crypto
import Foundation
#if canImport(FoundationNetworking)
    // Linux support
    import FoundationNetworking
#endif

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

/**
 Service for performing requests. A valid JWT is required to perform requests.
 
 It is possible to just perform a single request, or to perform requests until all items has been fetched, if the response type supports paging.
 
 If the JWT has expired, it will be renewed before the request is performed.
 */
public class BagbutikService: BagbutikServiceProtocol {
    internal private(set) var jwt: JWT
    private let urlSession: URLSessionProtocol
    
    public init(jwt: JWT, urlSession: URLSessionProtocol = URLSession.shared) {
        self.jwt = jwt
        self.urlSession = urlSession
    }
    
    private static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let isoDateFormatter = ISO8601DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = isoDateFormatter.date(from: dateString) {
                return date
            } else if let date = dateFormatter.date(from: dateString) {
                return date
            }
            throw ServiceError.wrongDateFormat(dateString: dateString)
        }
        return decoder
    }()
    
    /**
     Perform a single request.
     
     - Parameters:
        - request: A `Request` with the desired `Parameters`.
     - Returns: The response of the request, decoded to the `ResponseType`.
     */
    public func request<T: Decodable>(_ request: Request<T, ErrorResponse>) async throws -> T {
        let urlRequest = request.asUrlRequest()
        return try await fetch(urlRequest)
    }
    
    /**
     Perform all requests required to get all items.
     
     The items for all responses will be in a single array.
     
     - Parameters:
        - request: A `Request` with the desired `Parameters`.
     - Returns: The responses of the requests, decoded to the `ResponseType` and an array with all the items.
     */
    public func requestAllPages<T: Decodable & PagedResponse>(_ request: Request<T, ErrorResponse>) async throws -> (responses: [T], data: [T.Data]) {
        let response = try await self.request(request)
        return try await requestAllPages(for: response)
    }
    
    /**
     Perform a single request to get the items for the next page.
     
     - Parameters:
        - response: The response for the previous page.
     - Returns: The response for the next page, decoded to the `ResponseType`.
     */
    public func requestNextPage<T: Decodable & PagedResponse>(for response: T) async throws -> T? {
        guard let urlString = response.links.next, let url = URL(string: urlString) else { return nil }
        let urlRequest = URLRequest(url: url)
        return try await fetch(urlRequest)
    }
    
    /**
     Perform all requests required to get all items for the rest of the pages.
     
     The items for all responses will be in a single array.
     
     - Parameters:
        - response: The response for the previous page.
     - Returns: The responses for the rest of the pages, decoded to the `ResponseType` and an array with all the items.
     */
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
