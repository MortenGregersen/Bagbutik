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
    
    /**
     Errors from the API or from the decoding of the responses.
     */
    enum BagbutikError: Error {
        /// Bad Request (HTTP status code 400). An error occurred with your request.
        case badRequest(ErrorResponse)
        /// Forbidden (HTTP status code 403). Request not authorized.
        case forbidden(ErrorResponse)
        /// Not Found (HTTP status code 404). Resource not found.
        case notFound(ErrorResponse)
        /// Conflict (HTTP status code 409). The provided resource data is not valid.
        case conflict(ErrorResponse)
        /// The date format in the response is unknown.
        case wrongDateFormat
        /// The error is unknown and not handled.
        case unknown
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
            throw BagbutikError.wrongDateFormat
        }
        return decoder
    }()
    
    public func request<T: Decodable>(_ request: Request<T, ErrorResponse>) -> AnyPublisher<T, Error> {
        let urlRequest = request.asUrlRequest(withSignedJwt: signedJwt)
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> T in
                if let httpResponse = response as? HTTPURLResponse {
                    if (200 ... 300).contains(httpResponse.statusCode) {
                        if T.self == GzipResponse.self {
                            return try GzipResponse(data: data) as! T
                        }
                        return try Self.jsonDecoder.decode(T.self, from: data)
                    } else if let errorResponse = try? Self.jsonDecoder.decode(ErrorResponse.self, from: data) {
                        switch httpResponse.statusCode {
                        case 400:
                            throw BagbutikError.badRequest(errorResponse)
                        case 403:
                            throw BagbutikError.forbidden(errorResponse)
                        case 404:
                            throw BagbutikError.notFound(errorResponse)
                        case 409:
                            throw BagbutikError.conflict(errorResponse)
                        default:
                            break
                        }
                    }
                }
                throw BagbutikError.unknown
            }
            .eraseToAnyPublisher()
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
