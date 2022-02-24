@testable import Bagbutik
import XCTest

final class BagbutikServiceTests: XCTestCase {
    var service: BagbutikService!
    var jwt: JWT!
    var mockURLSession: MockURLSession!
    let jsonEncoder = JSONEncoder()
    let errorResponse = ErrorResponse(errors: [
        .init(code: "some-code", detail: "some-detail", status: "some-status", title: "some-title"),
    ])

    func setUpService(expiredJWT: Bool = false) throws {
        mockURLSession = .init()
        if expiredJWT {
            DateFactory.fromTimeIntervalSinceNow = { _ in Date.distantPast }
        }
        jwt = try JWT(keyId: JWTTests.keyId, issuerId: JWTTests.issuerId, privateKey: JWTTests.privateKey)
        DateFactory.reset()
        service = .init(jwt: jwt, urlSession: mockURLSession)
    }

    func testRequest_PlainResponse() async throws {
        try setUpService()
        let request: Request<AppResponse, ErrorResponse> = .getApp(id: "app-id")
        let expectedResponse = AppResponse(data: .init(id: "app-id", links: .init(self: "")), links: .init(self: ""))
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: try jsonEncoder.encode(expectedResponse),
                                                                      type: .http(statusCode: 200))
        let response = try await service.request(request)
        XCTAssertEqual(response, expectedResponse)
    }

    func testRequest_GzipResponse() async throws {
        try setUpService()
        let request: Request<GzipResponse, ErrorResponse> = .getSalesReports()
        let data = GunzipTests.gzipData
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: data, type: .http(statusCode: 200))
        let response = try await service.request(request)
        XCTAssertEqual(response.data, data)
    }

    func testRequest_EmptyResponse() async throws {
        try setUpService()
        let request: Request<EmptyResponse, ErrorResponse> = .deleteBundleId(id: "some-id")
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: Data(), type: .http(statusCode: 200))
        let response = try await service.request(request)
        XCTAssertEqual(response, EmptyResponse())
    }

    func testRequest_StatusCodeMapping() async throws {
        try setUpService()
        let data = try jsonEncoder.encode(errorResponse)
        let responses: [(statusCode: Int, error: ServiceError)] = [
            (statusCode: 400, error: .badRequest(errorResponse)),
            (statusCode: 401, error: .unauthorized(errorResponse)),
            (statusCode: 403, error: .forbidden(errorResponse)),
            (statusCode: 404, error: .notFound(errorResponse)),
            (statusCode: 409, error: .conflict(errorResponse)),
            (statusCode: 418, error: .unknownHTTPError(statusCode: 418, data: data)),
        ]
        for response in responses {
            let request: Request<AppsResponse, ErrorResponse> = .listApps()
            mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: try jsonEncoder.encode(errorResponse),
                                                                          type: .http(statusCode: response.statusCode))
            await XCTAssertAsyncThrowsError(try await service.request(request)) { error in
                XCTAssertEqual(error as! ServiceError, response.error)
            }
        }
    }

    func testRequest_UnknownResponseType() async throws {
        try setUpService()
        let request: Request<AppsResponse, ErrorResponse> = .listApps()
        let data = Data("Test".utf8)
        mockURLSession.wrapInHTTPURLResponse = false
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: data, type: .url)
        await XCTAssertAsyncThrowsError(try await service.request(.listApps())) { error in
            XCTAssertEqual(error as! ServiceError, .unknown(data: data))
        }
    }

    func testRequestAllPages() async throws {
        try setUpService()
        let request: Request<AppsResponse, ErrorResponse> = .listApps()
        let responses: [AppsResponse] = [
            .init(data: [.init(id: "app1", links: .init(self: ""))], links: .init(next: "https://next1", self: "")),
            .init(data: [.init(id: "app2", links: .init(self: ""))], links: .init(next: "https://next2", self: "")),
            .init(data: [.init(id: "app3", links: .init(self: ""))], links: .init(next: nil, self: "")),
        ]
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: try jsonEncoder.encode(responses[0]),
                                                                      type: .http(statusCode: 200))
        mockURLSession.responsesByUrl[URL(string: responses[0].links.next!)!] = (data: try jsonEncoder.encode(responses[1]),
                                                                                 type: .http(statusCode: 200))
        mockURLSession.responsesByUrl[URL(string: responses[1].links.next!)!] = (data: try jsonEncoder.encode(responses[2]),
                                                                                 type: .http(statusCode: 200))

        let response = try await service.requestAllPages(request)
        XCTAssertEqual(response.data, responses.map(\.data).flatMap { $0 })
    }

    func testDateDecoding_ISO8601() async throws {
        try setUpService()
        let dateString = "2021-09-13T13:01:52-07:00"
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: dateString)!
        let jsonString = """
        {
            "date": "\(dateString)"
        }
        """
        let request: Request<CrazyDatesResponse, ErrorResponse> = .getCrazyDates()
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: Data(jsonString.utf8), type: .http(statusCode: 200))
        let response = try await service.request(request)
        XCTAssertEqual(response.date, date)
    }
    
    func testDateDecoding_CustomDate() async throws {
        try setUpService()
        let dateString = "2021-07-31T21:49:11.000+00:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        let date = dateFormatter.date(from: dateString)!
        let jsonString = """
        {
            "date": "\(dateString)"
        }
        """
        let request: Request<CrazyDatesResponse, ErrorResponse> = .getCrazyDates()
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: Data(jsonString.utf8), type: .http(statusCode: 200))
        let response = try await service.request(request)
        XCTAssertEqual(response.date, date)
    }

    func testDateDecoding_InvalidDate() async throws {
        try setUpService()
        let jsonString = """
        {
            "date": "invalid-date"
        }
        """
        let request: Request<CrazyDatesResponse, ErrorResponse> = .getCrazyDates()
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: Data(jsonString.utf8), type: .http(statusCode: 200))
        await XCTAssertAsyncThrowsError(try await service.request(request)) { error in
            XCTAssertEqual(error as! ServiceError, .wrongDateFormat(dateString: "invalid-date"))
        }
    }

    func testJWTRenewal() async throws {
        try setUpService(expiredJWT: true)
        XCTAssertTrue(service.jwt.isExpired)
        let request: Request<AppResponse, ErrorResponse> = .getApp(id: "app-id")
        let expectedResponse = AppResponse(data: .init(id: "app-id", links: .init(self: "")), links: .init(self: ""))
        mockURLSession.responsesByUrl[request.asUrlRequest().url!] = (data: try jsonEncoder.encode(expectedResponse),
                                                                      type: .http(statusCode: 200))
        _ = try await service.request(request)
        XCTAssertFalse(service.jwt.isExpired)
    }
}

class MockURLSession: URLSessionProtocol {
    var responsesByUrl: [URL: (data: Data, type: ResponseType)] = [:]
    var wrapInHTTPURLResponse = true

    enum ResponseType {
        case http(statusCode: Int)
        case url
    }

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        XCTAssertTrue(request.allHTTPHeaderFields?.contains(where: { $0.key == "Authorization" }) ?? false)
        let response = responsesByUrl[request.url!]!
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

extension App: Equatable {
    public static func == (lhs: App, rhs: App) -> Bool {
        lhs.id == rhs.id
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
