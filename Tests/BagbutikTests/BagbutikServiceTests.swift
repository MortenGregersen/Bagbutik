import Bagbutik
import XCTest

final class BagbutikServiceTests: XCTestCase {
    var service: BagbutikService!
    var mockURLSession: MockURLSession!
    let jsonEncoder = JSONEncoder()
    let errorResponse = ErrorResponse(errors: [
        .init(code: "some-code", detail: "some-detail", status: "some-status", title: "some-title"),
    ])

    override func setUp() async throws {
        try await super.setUp()
        mockURLSession = .init()
        let jwt = try JWT(keyId: JWTTests.keyId, issuerId: JWTTests.issuerId, privateKey: JWTTests.privateKey)
        service = .init(jwt: jwt, urlSession: mockURLSession)
    }

    func testRequest_PlainResponse() async throws {
        let expectedResponse = AppResponse(data: .init(id: "app-id", links: .init(self: "")), links: .init(self: ""))
        mockURLSession.responses.append((data: try jsonEncoder.encode(expectedResponse), type: .http(statusCode: 200)))
        let response = try await service.request(.getApp(id: "app-id"))
        XCTAssertEqual(response, expectedResponse)
    }

    func testRequest_GzipResponse() async throws {
        let data = GunzipTests.gzipData
        mockURLSession.responses.append((data: data, type: .http(statusCode: 200)))
        let response = try await service.request(.getSalesReports())
        XCTAssertEqual(response.data, data)
    }

    func testRequest_EmptyResponse() async throws {
        mockURLSession.responses.append((data: Data(), type: .http(statusCode: 200)))
        let response = try await service.request(.deleteBundleId(id: "some-id"))
        XCTAssertEqual(response, EmptyResponse())
    }

    func testRequest_BadRequest() async throws {
        mockURLSession.responses.append((data: try jsonEncoder.encode(errorResponse), type: .http(statusCode: 400)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .badRequest(errorResponse))
        }
    }

    func testRequest_Unauthorized() async throws {
        mockURLSession.responses.append((data: try jsonEncoder.encode(errorResponse), type: .http(statusCode: 401)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .unauthorized(errorResponse))
        }
    }

    func testRequest_Forbidden() async throws {
        mockURLSession.responses.append((data: try jsonEncoder.encode(errorResponse), type: .http(statusCode: 403)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .forbidden(errorResponse))
        }
    }

    func testRequest_NotFound() async throws {
        mockURLSession.responses.append((data: try jsonEncoder.encode(errorResponse), type: .http(statusCode: 404)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .notFound(errorResponse))
        }
    }

    func testRequest_Conflict() async throws {
        mockURLSession.responses.append((data: try jsonEncoder.encode(errorResponse), type: .http(statusCode: 409)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .conflict(errorResponse))
        }
    }

    func testRequest_UnknownStatusCode() async throws {
        let data = try jsonEncoder.encode(errorResponse)
        mockURLSession.responses.append((data: data, type: .http(statusCode: 418)))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .unknownHTTPError(statusCode: 418, data: data))
        }
    }

    func testRequest_UnknownResponseType() async throws {
        let data = Data("Test".utf8)
        mockURLSession.wrapInHTTPURLResponse = false
        mockURLSession.responses.append((data: data, type: .url))
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .unknown(data: data))
        }
    }

    func testDateDecoding_ISO8601() async throws {
        let dateString = "2021-09-13T13:01:52-07:00"
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: dateString)!
        let jsonString = """
        {
            "date": "\(dateString)"
        }
        """
        mockURLSession.responses = [(data: Data(jsonString.utf8), type: .http(statusCode: 200))]
        let response = try await service.request(.getCrazyDates())
        XCTAssertEqual(response.date, date)
    }

    func testDateDecoding_InvalidDate() async throws {
        let jsonString = """
        {
            "date": "invalid-date"
        }
        """
        mockURLSession.responses = [(data: Data(jsonString.utf8), type: .http(statusCode: 200))]
        await XCTAssertAsyncThrowsError(try await service.request(.getCrazyDates())) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}

class MockURLSession: URLSessionProtocol {
    var responses: [(data: Data, type: ResponseType)] = []
    var wrapInHTTPURLResponse = true

    enum ResponseType {
        case http(statusCode: Int)
        case url
    }

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        let response = responses.first!
        switch response.type {
        case .http(let statusCode):
            return (response.data, HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!)
        case .url:
            return (response.data, URLResponse())
        }
    }
}

extension AppResponse: Equatable {
    public static func == (lhs: AppResponse, rhs: AppResponse) -> Bool {
        lhs.data.id == rhs.data.id
    }
}

extension EmptyResponse: Equatable {
    public static func == (lhs: EmptyResponse, rhs: EmptyResponse) -> Bool {
        true
    }
}

extension ErrorResponse.Errors: Equatable {
    public static func == (lhs: ErrorResponse.Errors, rhs: ErrorResponse.Errors) -> Bool {
        lhs.code == rhs.code
            && lhs.detail == rhs.detail
            && lhs.status == rhs.status
            && lhs.title == rhs.title
    }
}

extension ErrorResponse: Equatable {
    public static func == (lhs: ErrorResponse, rhs: ErrorResponse) -> Bool {
        lhs.errors == rhs.errors
    }
}

extension ServiceError: Equatable {
    public static func == (lhs: ServiceError, rhs: ServiceError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest(let lhsResponse), .badRequest(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.unauthorized(let lhsResponse), .unauthorized(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.forbidden(let lhsResponse), .forbidden(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.notFound(let lhsResponse), .notFound(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.conflict(let lhsResponse), .conflict(let rhsResponse)):
            return lhsResponse == rhsResponse
        case (.wrongDateFormat(let lhsDateString), .wrongDateFormat(let rhsDateString)):
            return lhsDateString == rhsDateString
        case (.unknownHTTPError(let lhsStatusCode, let lhsData), .unknownHTTPError(let rhsStatusCode, let rhsData)):
            return lhsStatusCode == rhsStatusCode && lhsData == rhsData
        case (.unknown(let lhsData), .unknown(let rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
}

struct CrazyDatesResponse: Decodable {
    let date: Date
}

extension Request {
    static func getCrazyDates() -> Request<CrazyDatesResponse, ErrorResponse> {
        .init(path: "/v1/crazyDates", method: .get)
    }
}
