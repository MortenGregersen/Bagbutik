@testable import Bagbutik_Core
import XCTest

final class JWTTests: XCTestCase {
    static let keyId = "P9M252746H"
    static let issuerId = "82067982-6b3b-4a48-be4f-5b10b373c5f2"
    static let privateKey = """
    -----BEGIN PRIVATE KEY-----
    MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgevZzL1gdAFr88hb2
    OF/2NxApJCzGCEDdfSp6VQO30hyhRANCAAQRWz+jn65BtOMvdyHKcvjBeBSDZH2r
    1RTwjmYSi9R/zpBnuQ4EiMnCqfMPWiZqB4QdbAd0E7oH50VpuZ1P087G
    -----END PRIVATE KEY-----
    """

    func testTeamInitialEncodedSignature() throws {
        let jwt = try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKey: Self.privateKey, dateFactory: .init(now: Date.distantFuture))
        XCTAssertFalse(jwt.isExpired)
        XCTAssertTrue(jwt.encodedSignature.hasPrefix("eyJ"))
    }
    
    func testIndividualInitialEncodedSignature() throws {
        let jwt = try JWT(keyId: Self.keyId, privateKey: Self.privateKey)
        XCTAssertFalse(jwt.isExpired)
        XCTAssertTrue(jwt.encodedSignature.hasPrefix("eyJ"))
    }

    func testInitialEncodedSignature_Renew() throws {
        var jwt = try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKey: Self.privateKey, dateFactory: .init(now: Date.distantPast))
        XCTAssertTrue(jwt.isExpired)
        jwt.dateFactory = .init()
        try jwt.renewEncodedSignature()
        XCTAssertFalse(jwt.isExpired)
    }

    func testRenew_UpdatesIssuedAtAndExpiration() throws {
        let initialDate = Date(timeIntervalSince1970: 1_700_000_000)
        var jwt = try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKey: Self.privateKey, dateFactory: .init(now: initialDate))
        let initialClaims = try Self.decodePayloadClaims(from: jwt.encodedSignature)
        XCTAssertEqual(initialClaims.iat, Int(initialDate.timeIntervalSince1970))
        XCTAssertEqual(initialClaims.exp, Int(initialDate.addingTimeInterval(20 * 60).timeIntervalSince1970))

        let renewalDate = Date(timeIntervalSince1970: 1_700_001_000)
        jwt.dateFactory = .init(now: renewalDate)
        try jwt.renewEncodedSignature()
        let renewedClaims = try Self.decodePayloadClaims(from: jwt.encodedSignature)
        XCTAssertEqual(renewedClaims.iat, Int(renewalDate.timeIntervalSince1970))
        XCTAssertEqual(renewedClaims.exp, Int(renewalDate.addingTimeInterval(20 * 60).timeIntervalSince1970))
    }

    func testInitWithPrivateKeyPath() {
        let privateKeyPath = Bundle.module.path(forResource: "test-private-key", ofType: "p8")!
        XCTAssertNoThrow(try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKeyPath: privateKeyPath))
    }

    private static func decodePayloadClaims(from encodedSignature: String) throws -> PayloadClaims {
        let segments = encodedSignature.split(separator: ".", omittingEmptySubsequences: false)
        guard segments.count == 3 else { throw NSError(domain: "JWTTests", code: 1) }

        let payloadSegment = String(segments[1])
        let base64 = payloadSegment
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
            .padding(toLength: ((payloadSegment.count + 3) / 4) * 4, withPad: "=", startingAt: 0)
        guard let payloadData = Data(base64Encoded: base64) else { throw NSError(domain: "JWTTests", code: 2) }

        return try JSONDecoder().decode(PayloadClaims.self, from: payloadData)
    }

    private struct PayloadClaims: Decodable {
        let iat: Int
        let exp: Int
    }
}
