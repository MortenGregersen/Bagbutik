import Combine
import Crypto
import Foundation

public class BagbutikService {
    private let header: Header
    private var payload: Payload
    private let privateKey: String
    private var signedJwt: String
    
    public init(keyId: String, issuerId: String, privateKey: String) throws {
        header = Header(kid: keyId)
        payload = Payload(iss: issuerId)
        self.privateKey = privateKey
        let jsonEncoder = JSONEncoder()
        let headerString = try jsonEncoder.encode(header).base64EncodedURLString()
        let payloadString = try jsonEncoder.encode(payload).base64EncodedURLString()
        let headerPayloadString = "\(headerString).\(payloadString)"
        let hashedDigest = SHA256.hash(data: headerPayloadString.data(using: .utf8)!)
        let signature = try P256.Signing.PrivateKey(pemRepresentation: privateKey).signature(for: hashedDigest)
        let signingString = signature.rawRepresentation.base64EncodedURLString()
        signedJwt = "\(headerString).\(payloadString).\(signingString)"
    }
    
    public convenience init(keyId: String, issuerId: String, privateKeyPath: String) throws {
        let privateKey = try String(contentsOf: URL(fileURLWithPath: privateKeyPath))
        try self.init(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
    }
    
    /// Errors from the API or from the decoding of the responses.
    public enum ServiceError: Error {
        /// Bad Request (HTTP status code 400). An error occurred with your request.
        case badRequest(ErrorResponse)
        /// Forbidden (HTTP status code 403). Request not authorized.
        case forbidden(ErrorResponse)
        /// Not Found (HTTP status code 404). Resource not found.
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
    
    public func request<T: Decodable>(_ request: Request<T, ErrorResponse>) -> AnyPublisher<T, Error> {
        let urlRequest = request.asUrlRequest(withSignedJwt: signedJwt)
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { try Self.decodeResponse(data: $0, response: $1) }
            .eraseToAnyPublisher()
    }
    
    public func request<T: Decodable>(_ request: Request<T, ErrorResponse>, completionHandler: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = request.asUrlRequest(withSignedJwt: signedJwt)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, _ in
            do {
                let decodedResponse: T = try Self.decodeResponse(data: data, response: response)
                completionHandler(.success(decodedResponse))
            } catch {
                completionHandler(.failure(error))
            }
        }).resume()
    }
    
    private static func decodeResponse<T: Decodable>(data: Data?, response: URLResponse?) throws -> T {
        if let data = data, let httpResponse = response as? HTTPURLResponse {
            if (200 ... 300).contains(httpResponse.statusCode) {
                if T.self == GzipResponse.self {
                    return try GzipResponse(data: data) as! T
                }
                else if T.self == EmptyResponse.self {
                    return EmptyResponse() as! T
                }
                return try Self.jsonDecoder.decode(T.self, from: data)
            } else if let errorResponse = try? Self.jsonDecoder.decode(ErrorResponse.self, from: data) {
                switch httpResponse.statusCode {
                case 400:
                    throw ServiceError.badRequest(errorResponse)
                case 403:
                    throw ServiceError.forbidden(errorResponse)
                case 404:
                    throw ServiceError.notFound(errorResponse)
                case 409:
                    throw ServiceError.conflict(errorResponse)
                default:
                    print(errorResponse)
                    break
                }
            }
            throw ServiceError.unknownHTTPError(statusCode: httpResponse.statusCode, data: data)
        }
        throw ServiceError.unknown(data: data)
    }
    
    private struct Header: Encodable {
        let alg = "ES256"
        let kid: String
        let typ = "kid"
    }
    
    private struct Payload: Encodable {
        let iss: String
        let exp = Int(Date(timeIntervalSinceNow: 20 * 60).timeIntervalSince1970)
        let aud = "appstoreconnect-v1"
    }
}

private extension DateFormatter {
    func date(from string: String, inFormat format: String) -> Date? {
        dateFormat = format
        return date(from: string)
    }
}
