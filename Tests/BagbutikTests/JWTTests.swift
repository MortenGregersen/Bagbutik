@testable import Bagbutik
import XCTest

final class JWTTests: XCTestCase {
    let keyId = "P9M252746H"
    let issuerId = "82067982-6b3b-4a48-be4f-5b10b373c5f2"
    let privateKey = """
    -----BEGIN PRIVATE KEY-----
    MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgevZzL1gdAFr88hb2
    OF/2NxApJCzGCEDdfSp6VQO30hyhRANCAAQRWz+jn65BtOMvdyHKcvjBeBSDZH2r
    1RTwjmYSi9R/zpBnuQ4EiMnCqfMPWiZqB4QdbAd0E7oH50VpuZ1P087G
    -----END PRIVATE KEY-----
    """

    func testInitialEncodedSignature() throws {
        DateFactory.fromTimeIntervalSinceNow = { _ in Date.distantFuture }
        let jwt = try JWT(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
        XCTAssertFalse(jwt.isExpired)
        XCTAssertTrue(jwt.encodedSignature.hasPrefix("eyJhbGciOiJFUzI1NiIsImtpZCI6IlA5TTI1Mjc0NkgiLCJ0eXAiOiJraWQifQ.eyJpc3MiOiI4MjA2Nzk4Mi02YjNiLTRhNDgtYmU0Zi01YjEwYjM3M2M1ZjIiLCJleHAiOjY0MDkyMjExMjAwLCJhdWQiOiJhcHBzdG9yZWNvbm5lY3QtdjEifQ"))
    }
    
    func testInitialEncodedSignature_Renew() throws {
        DateFactory.fromTimeIntervalSinceNow = { _ in Date.distantPast }
        var jwt = try JWT(keyId: keyId, issuerId: issuerId, privateKey: privateKey)
        DateFactory.fromTimeIntervalSinceNow = Date.init(timeIntervalSinceNow:)
        XCTAssertTrue(jwt.isExpired)
        DateFactory.fromTimeIntervalSinceNow = { _ in Date.distantFuture }
        try jwt.renewEncodedSignature()
        XCTAssertFalse(jwt.isExpired)
    }
}
