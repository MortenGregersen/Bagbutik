#if canImport(CryptoKit)
import CryptoKit
#else
import Crypto
#endif
import Foundation

/**
 A JSON Web Token used to authorize requests sent through ``BagbutikService``.

 Bagbutik creates tokens with Apple's required ES256 signature and a 20 minute expiration.
 When a service sends a request, the signature is regenerated automatically if the current
 token has expired.

 Full documentation for how JWT is used with the API:
 <https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests>
 */
public struct JWT: Sendable {
    /// A value telling if the JWT has expired.
    public var isExpired: Bool { payload.isExpired }
    /// The signature to use in the authorization header when performing requests.
    public private(set) var encodedSignature: String
    private let header: Header
    private var payload: Payload
    private let privateKey: String
    
    var dateFactory: DateFactory {
        didSet { payload.dateFactory = dateFactory }
    }
    
    /**
     Creates a token for a team based API key.

     Use this initializer for the standard App Store Connect API keys that include both a key
     ID and an issuer ID.

     Full documentation for how to get the required keys:
     <https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api>

     - Parameters:
        - keyId: Your private key ID from App Store Connect, for example `2X9R4HXF34`.
        - issuerId: Your issuer ID from the API Keys page in App Store Connect.
        - privateKey: The contents of the downloaded `.p8` private key.
      */
    public init(keyId: String, issuerId: String, privateKey: String) throws {
        try self.init(keyId: keyId, issuerId: issuerId, privateKey: privateKey, dateFactory: DateFactory())
    }
    
    /**
     Creates a token for a team based API key by loading the private key from disk.

     - Parameters:
        - keyId: Your private key ID from App Store Connect.
        - issuerId: Your issuer ID from the API Keys page in App Store Connect.
        - privateKeyPath: A file system path to the downloaded `.p8` private key.
      */
    public init(keyId: String, issuerId: String, privateKeyPath: String) throws {
        let privateKey = try String(contentsOf: URL(fileURLWithPath: privateKeyPath), encoding: .utf8)
        try self.init(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
    }
    
    /**
     Creates a token for an individual API key.

     Use this initializer when Apple does not provide an issuer ID for the key.

     - Parameters:
        - keyId: Your private key ID from App Store Connect.
        - privateKey: The contents of the downloaded `.p8` private key.
      */
    public init(keyId: String, privateKey: String) throws {
        try self.init(keyId: keyId, issuerId: nil, privateKey: privateKey, dateFactory: DateFactory())
    }
    
    /**
     Creates a token for an individual API key by loading the private key from disk.

     - Parameters:
        - keyId: Your private key ID from App Store Connect.
        - privateKeyPath: A file system path to the downloaded `.p8` private key.
      */
    public init(keyId: String, privateKeyPath: String) throws {
        let privateKey = try String(contentsOf: URL(fileURLWithPath: privateKeyPath), encoding: .utf8)
        try self.init(keyId: keyId, privateKey: privateKey)
    }
    
    init(keyId: String, issuerId: String?, privateKey: String, dateFactory: DateFactory) throws {
        header = Header(kid: keyId)
        payload = Payload(iss: issuerId, dateFactory: dateFactory)
        self.privateKey = privateKey
        encodedSignature = try Self.createEncodedSignature(header: header, payload: payload, privateKey: privateKey)
        self.dateFactory = dateFactory
    }
    
    mutating func renewEncodedSignature() throws {
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
        let alg: String
        let kid: String
        let typ: String

        init(kid: String) {
            self.alg = "ES256"
            self.kid = kid
            self.typ = "JWT"
        }
    }
    
    private struct Payload: Encodable, Sendable {
        let type: KeyType
        private(set) var iat: Int
        private(set) var exp: Int
        let aud = "appstoreconnect-v1"
        
        var dateFactory: DateFactory
        var isExpired: Bool { Date(timeIntervalSince1970: TimeInterval(exp)) < Date(timeIntervalSinceNow: 0) }
        
        enum KeyType {
            case team(issuerId: String)
            case individual
        }
        
        init(iss: String?, dateFactory: DateFactory) {
            if let iss {
                type = .team(issuerId: iss)
            } else {
                type = .individual
            }
            self.dateFactory = dateFactory
            iat = 0
            exp = 0
            renewExp()
        }
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch type {
            case .team(let issuerId):
                try container.encode(issuerId, forKey: .iss)
            case .individual:
                try container.encode("user", forKey: .sub)
            }
            try container.encode(iat, forKey: .iat)
            try container.encode(exp, forKey: .exp)
            try container.encode(aud, forKey: .aud)
        }

        enum CodingKeys: String, CodingKey {
            case iss, sub, iat, exp, aud
        }
        
        mutating func renewExp() {
            let issuedAtDate = dateFactory.createDate(fromTimeIntervalSinceNow: 0)
            iat = Int(issuedAtDate.timeIntervalSince1970)
            exp = Int(issuedAtDate.addingTimeInterval(20 * 60).timeIntervalSince1970)
        }
    }
}

struct DateFactory: Sendable {
    let now: Date?
    
    init(now: Date? = nil) {
        self.now = now
    }
    
    func createDate(fromTimeIntervalSinceNow timeIntervalSinceNow: TimeInterval) -> Date {
        (now ?? .now).addingTimeInterval(timeIntervalSinceNow)
    }
}
