#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif
import Foundation
#if canImport(FoundationNetworking)
// Non-Apple platform support
import BagbutikPolyfill
import FoundationNetworking
#endif

/**
 The async transport closure used by ``BagbutikService``.

 Provide a custom implementation when you want to stub network traffic in tests, route
 requests through a custom `URLSession`, or attach your own delegate handling.

 - Parameters:
    - request: The request to execute.
    - delegate: An optional task specific delegate.
 - Returns: The raw response body and URL response returned by the transport.
 */
public typealias FetchData = @Sendable (_ request: URLRequest, _ delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)

/**
 Service responsible for sending generated App Store Connect requests.

 A service instance owns the current JWT and automatically refreshes its signature before a
 request is sent if the token has expired. It also centralizes response decoding, HTTP error
 mapping, and pagination helpers for responses conforming to ``PagedResponse``.
 */
public actor BagbutikService {
    var jwt: JWT
    private let fetchData: FetchData

    /**
     Creates a service that can execute generated ``Request`` values.

     - Parameters:
        - jwt: The token used to authorize outgoing requests.
        - fetchData: The transport closure used to execute requests. The default uses `URLSession.shared`.
     */
    public init(jwt: JWT, fetchData: @escaping FetchData = URLSession.shared.data(for:delegate:)) {
        self.jwt = jwt
        self.fetchData = fetchData
    }

    private static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = ISO8601DateFormatter().date(from: dateString) {
                return date
            } else if let date = dateFormatter.date(from: dateString) {
                return date
            }
            throw ServiceError.wrongDateFormat(dateString: dateString)
        }
        return decoder
    }()

    /**
     Executes a single request and decodes the response body into the request's response type.

     - Parameter request: The generated request to execute.
     - Returns: The decoded response value.
     */
    public func request<T>(_ request: Request<T, ErrorResponse>) async throws -> T
        where T: Decodable & Sendable {
        let urlRequest = try request.asUrlRequest()
        return try await fetch(urlRequest)
    }

    /**
     Executes a request that is expected to succeed without returning a response body.

     - Parameter request: The generated request to execute.
     - Returns: An ``EmptyResponse`` value when the request succeeds.
     */
    @discardableResult
    public func request(_ request: Request<EmptyResponse, ErrorResponse>) async throws -> EmptyResponse {
        let urlRequest = try request.asUrlRequest()
        return try await fetch(urlRequest)
    }

    /**
     Executes the initial paged request and follows `next` links until every page has been fetched.

     The returned `responses` array preserves page order. The returned `data` array is the
     concatenation of every page's `data` collection in that same order.

     - Parameter request: The first paged request to execute.
     - Returns: All decoded page responses and a flattened array of every resource item.
     */
    public func requestAllPages<T>(_ request: Request<T, ErrorResponse>) async throws -> (responses: [T], data: [T.Data])
        where T: Decodable & PagedResponse & Sendable, T.Data: Sendable {
        let response = try await self.request(request)
        return try await requestAllPages(for: response)
    }

    /**
     Fetches the next page for a paged response.

     - Parameter response: A previously decoded paged response.
     - Returns: The next decoded page, or `nil` when no `next` link is available.
     */
    public func requestNextPage<T>(for response: T) async throws -> T?
        where T: Decodable & PagedResponse & Sendable {
        guard let urlString = response.links.next, let url = URL(string: urlString) else { return nil }
        let urlRequest = URLRequest(url: url)
        return try await fetch(urlRequest)
    }

    /**
     Continues fetching pages starting from an already decoded first page.

     This is useful when you need to inspect the first page before deciding whether to load the
     rest of the result set.

     - Parameter response: The first page that has already been fetched.
     - Returns: All page responses including `response`, plus a flattened array of every item.
     */
    public func requestAllPages<T>(for response: T) async throws -> (responses: [T], data: [T.Data])
        where T: Decodable & PagedResponse & Sendable, T.Data: Sendable {
        var responses = [response]
        while let nextResponse = try await requestNextPage(for: responses.last!) {
            responses.append(nextResponse)
        }
        return (responses: responses, data: responses.flatMap(\.data))
    }

    private func fetch<T>(_ urlRequest: URLRequest) async throws -> T
        where T: Decodable & Sendable {
        var urlRequest = urlRequest
        if jwt.isExpired {
            try jwt.renewEncodedSignature()
        }
        urlRequest.addJWTAuthorizationHeader(jwt.encodedSignature)
        let dataAndResponse = try await fetchData(urlRequest, nil)
        return try Self.decodeResponse(data: dataAndResponse.0, response: dataAndResponse.1) as T
    }

    private static func decodeResponse<T>(data: Data, response: URLResponse) throws -> T
        where T: Decodable & Sendable {
        if let httpResponse = response as? HTTPURLResponse {
            if (200 ... 399).contains(httpResponse.statusCode) {
                if let binaryResponse = T.self as? BinaryResponse.Type {
                    return binaryResponse.from(data: data) as! T
                } else if T.self == EmptyResponse.self {
                    return EmptyResponse() as! T
                }
                return try Self.jsonDecoder.decode(T.self, from: data)
            } else if let errorResponse = try? jsonDecoder.decode(ErrorResponse.self, from: data) {
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
                case 422:
                    throw ServiceError.unprocessableEntity(errorResponse)
                default:
                    break
                }
            }
            throw ServiceError.unknownHTTPError(statusCode: httpResponse.statusCode, data: data)
        }
        throw ServiceError.unknown(data: data)
    }

    func replaceJWT(_ jwt: JWT) {
        self.jwt = jwt
    }
}
