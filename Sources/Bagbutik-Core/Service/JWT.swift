#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif
import Foundation

/**
 A JSON Web Token (JWT) to be used to authorize API requests.
 
 The JWT is valid for 20 minutes, but will be renewed automatically when performing requests with `BagbutikService`.
 
 Full documentation for how JWT is used with the API:
 <https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests>
 */
public struct JWT {
    /// A value telling if the JWT has expired.
    public var isExpired: Bool { payload.isExpired }
    /// The signature to use in the authorization header when performing requests.
    public private(set) var encodedSignature: String
    private let header: Header
    private var payload: Payload
    private let privateKey: String
    
    /**
     Create a new JWT.
     
     Full documentation for how to get the required keys.
     <https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api>
     
     - Parameters:
        - keyID: Your private key ID from App Store Connect; for example 2X9R4HXF34.
        - issuerId: Your issuer ID from the API Keys page in App Store Connect; for example, 57246542-96fe-1a63-e053-0824d011072a.
        - privateKey: The contents of your private key from App Store Connect. Starting with `-----BEGIN PRIVATE KEY-----`.
      */
    public init(keyId: String, issuerId: String, privateKey: String) throws {
        header = Header(kid: keyId)
        payload = Payload(iss: issuerId)
        self.privateKey = privateKey
        encodedSignature = try Self.createEncodedSignature(header: header, payload: payload, privateKey: privateKey)
    }
    
    /**
     Create a new JWT.
     
     Full documentation for how to get the required keys.
     <https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api>
     
     - Parameters:
        - keyID: Your private key ID from App Store Connect; for example 2X9R4HXF34.
        - issuerId: Your issuer ID from the API Keys page in App Store Connect; for example, 57246542-96fe-1a63-e053-0824d011072a.
        - privateKeyPath: The file path to your private key from App Store Connect.
      */
    public init(keyId: String, issuerId: String, privateKeyPath: String) throws {
        let privateKey = try String(contentsOf: URL(fileURLWithPath: privateKeyPath))
        try self.init(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
    }
    
    internal mutating func renewEncodedSignature() throws {
        payload.renewExp()
        encodedSignature = try Self.createEncodedSignature(header: header, payload: payload, privateKey: privateKey)
    }
    
    private static func createEncodedSignature(header: Header, payload: Payload, privateKey: String) throws -> String {
        let jsonEncoder = JSONEncoder()
        let headerString = try jsonEncoder.encode(header).base64EncodedURLString()
        let payloadString = try jsonEncoder.encode(payload).base64EncodedURLString()
        let headerPayloadString = "\(headerString).\(payloadString)"
        let hashedDigest = SHA256.hash(data: headerPayloadString.data(using: .utf8)!)
        let signature = try P256.Signing.PrivateKey(pemRepresentation: privateKey).signature(for: hashedDigest)
        let signingString = signature.rawRepresentation.base64EncodedURLString()
        return "\(headerString).\(payloadString).\(signingString)"
    }
    
    private struct Header: Encodable {
        let alg = "ES256"
        let kid: String
        let typ = "kid"
    }
    
    private struct Payload: Encodable {
        var iss: String
        var exp: Int
        let aud = "appstoreconnect-v1"
        var isExpired: Bool { Date(timeIntervalSince1970: TimeInterval(exp)) < DateFactory.fromTimeIntervalSinceNow(0) }
        
        init(iss: String) {
            self.iss = iss
            exp = Self.createExp()
        }
        
        mutating func renewExp() {
            exp = Self.createExp()
        }
        
        private static func createExp() -> Int {
            Int(DateFactory.fromTimeIntervalSinceNow(20 * 60).timeIntervalSince1970)
        }
    }
}
