import Crypto
import Foundation

public struct JWT {
    public var isExpired: Bool { payload.isExpired }
    public private(set) var encodedSignature: String
    private let header: Header
    private var payload: Payload
    private let privateKey: String
    
    public init(keyId: String, issuerId: String, privateKey: String) throws {
        header = Header(kid: keyId)
        payload = Payload(iss: issuerId)
        self.privateKey = privateKey
        encodedSignature = try Self.createEncodedSignature(header: header, payload: payload, privateKey: privateKey)
    }
    
    public init(keyId: String, issuerId: String, privateKeyPath: String) throws {
        let privateKey = try String(contentsOf: URL(fileURLWithPath: privateKeyPath))
        try self.init(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
    }
    
    public mutating func renewEncodedSignature() throws {
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
        let iss: String
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
            return Int(DateFactory.fromTimeIntervalSinceNow(20 * 60).timeIntervalSince1970)
        }
    }
}
