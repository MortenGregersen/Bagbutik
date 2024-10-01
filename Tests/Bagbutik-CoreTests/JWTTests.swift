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

    func testInitialEncodedSignature() throws {
        let jwt = try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKey: Self.privateKey, dateFactory: .init(now: Date.distantFuture))
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

    func testInitWithPrivateKeyPath() {
        let privateKeyPath = Bundle.module.path(forResource: "test-private-key", ofType: "p8")!
        XCTAssertNoThrow(try JWT(keyId: Self.keyId, issuerId: Self.issuerId, privateKeyPath: privateKeyPath))
    }
}
