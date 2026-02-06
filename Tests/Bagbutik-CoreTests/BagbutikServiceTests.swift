import Bagbutik_AppStore
@testable import Bagbutik_Core
import Bagbutik_Models
import XCTest
#if canImport(FoundationNetworking)
// Non-Apple platform support
import FoundationNetworking
#endif

@MainActor final class BagbutikServiceTests: XCTestCase, Sendable {
    var service: BagbutikService!
    var jwt: JWT!
    let jsonEncoder = JSONEncoder()
    let errorResponse = ErrorResponse(errors: [
        .init(code: "some-code", detail: "some-detail", status: "some-status", title: "some-title"),
    ])

    func setUpService(expiredJWT: Bool = false, responsesByUrl: [URL: (data: Data, type: ResponseType)]) throws {
        let mockURLSession = MockURLSession(responsesByUrl: responsesByUrl)
        let dateFactory = DateFactory(now: expiredJWT ? Date.distantPast : Date.now)
        jwt = try JWT(keyId: JWTTests.keyId, issuerId: JWTTests.issuerId, privateKey: JWTTests.privateKey, dateFactory: dateFactory)
        let fetchData = mockURLSession.data(for:delegate:)
        service = .init(jwt: jwt, fetchData: fetchData)
    }

    func testRequest_PlainResponse() async throws {
        let request: Request<AppResponse, ErrorResponse> = .getAppV1(id: "app-id")
        let expectedResponse = AppResponse(data: .init(id: "app-id", links: .init(self: "")), links: .init(self: ""))
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: jsonEncoder.encode(expectedResponse), type: .http(statusCode: 200))])
        let response = try await service.request(request)
        XCTAssertEqual(response, expectedResponse)
    }

    func testRequest_GzipResponse() async throws {
        let request: Request<GzipResponse, ErrorResponse> = .getAwesomeReports()
        let data = GunzipTests.gzipData
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: data, type: .http(statusCode: 200))])
        let response = try await service.request(request)
        XCTAssertEqual(response.data, data)
    }

    func testRequest_EmptyResponse() async throws {
        let request: Request<EmptyResponse, ErrorResponse> = .deleteAppEventV1(id: "some-id")
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: Data(), type: .http(statusCode: 200))])
        let response = try await service.request(request)
        XCTAssertEqual(response, EmptyResponse())
    }

    func testRequest_StatusCodeMapping() async throws {
        let data = try jsonEncoder.encode(errorResponse)
        let responses: [(statusCode: Int, error: ServiceError)] = [
            (statusCode: 400, error: .badRequest(errorResponse)),
            (statusCode: 401, error: .unauthorized(errorResponse)),
            (statusCode: 403, error: .forbidden(errorResponse)),
            (statusCode: 404, error: .notFound(errorResponse)),
            (statusCode: 409, error: .conflict(errorResponse)),
            (statusCode: 422, error: .unprocessableEntity(errorResponse)),
            (statusCode: 418, error: .unknownHTTPError(statusCode: 418, data: data)),
        ]
        for response in responses {
            let request: Request<AppsResponse, ErrorResponse> = .listAppsV1()
            try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: data, type: .http(statusCode: response.statusCode))])
            await XCTAssertAsyncThrowsError(try await service.request(request)) { error in
                XCTAssertEqual(error as! ServiceError, response.error)
            }
        }
    }

    func testRequest_UnknownResponseType() async throws {
        let request: Request<AppsResponse, ErrorResponse> = .listAppsV1()
        let data = Data("Test".utf8)
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: data, type: .url)])
        await XCTAssertAsyncThrowsError(try await service.request(.listAppsV1())) { error in
            XCTAssertEqual(error as! ServiceError, .unknown(data: data))
        }
    }

    func testRequestAllPages() async throws {
        let request: Request<AppsResponse, ErrorResponse> = .listAppsV1()
        let responses: [AppsResponse] = [
            .init(data: [.init(id: "app1", links: .init(self: ""))], links: .init(next: "https://next1", self: "")),
            .init(data: [.init(id: "app2", links: .init(self: ""))], links: .init(next: "https://next2", self: "")),
            .init(data: [.init(id: "app3", links: .init(self: ""))], links: .init(next: nil, self: "")),
        ]
        try setUpService(responsesByUrl: [
            try request.asUrlRequest().url!: (data: jsonEncoder.encode(responses[0]), type: .http(statusCode: 200)),
            URL(string: responses[0].links.next!)!: (data: jsonEncoder.encode(responses[1]), type: .http(statusCode: 200)),
            URL(string: responses[1].links.next!)!: (data: jsonEncoder.encode(responses[2]), type: .http(statusCode: 200))
        ])
        let response = try await service.requestAllPages(request)
        XCTAssertEqual(response.data, responses.map(\.data).flatMap { $0 })
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
        let request: Request<CrazyDatesResponse, ErrorResponse> = .getCrazyDates()
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: Data(jsonString.utf8), type: .http(statusCode: 200))])
        let response = try await service.request(request)
        XCTAssertEqual(response.date, date)
    }

    func testDateDecoding_CustomDate() async throws {
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
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: Data(jsonString.utf8), type: .http(statusCode: 200))])
        let response = try await service.request(request)
        XCTAssertEqual(response.date, date)
    }

    func testDateDecoding_InvalidDate() async throws {
        let jsonString = """
        {
            "date": "invalid-date"
        }
        """
        let request: Request<CrazyDatesResponse, ErrorResponse> = .getCrazyDates()
        try setUpService(responsesByUrl: [try request.asUrlRequest().url!: (data: Data(jsonString.utf8), type: .http(statusCode: 200))])
        await XCTAssertAsyncThrowsError(try await service.request(request)) { error in
            XCTAssertEqual(error as! ServiceError, .wrongDateFormat(dateString: "invalid-date"))
        }
    }

    @MainActor
    func testJWTRenewal() async throws {
        let request: Request<AppResponse, ErrorResponse> = .getAppV1(id: "app-id")
        let expectedResponse = AppResponse(data: .init(id: "app-id", links: .init(self: "")), links: .init(self: ""))
        try setUpService(expiredJWT: true, responsesByUrl: [try request.asUrlRequest().url!: (data: jsonEncoder.encode(expectedResponse), type: .http(statusCode: 200))])
        let isExpiredBefore = await service.jwt.isExpired
        XCTAssertTrue(isExpiredBefore)
        jwt.dateFactory = .init()
        await service.replaceJWT(jwt)
        _ = try await service.request(request)
        let isExpiredAfter = await service.jwt.isExpired
        XCTAssertFalse(isExpiredAfter)
    }
}

final class MockURLSession: Sendable {
    let responsesByUrl: [URL: (data: Data, type: ResponseType)]

    init(responsesByUrl: [URL: (data: Data, type: ResponseType)]) {
        self.responsesByUrl = responsesByUrl
    }

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        XCTAssertTrue(request.allHTTPHeaderFields?.contains(where: { $0.key == "Authorization" }) ?? false)
        let response = responsesByUrl[request.url!]!
        switch response.type {
        case .http(let statusCode):
            return (response.data, HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!)
        case .url:
            return (response.data, URLResponse(url: request.url!, mimeType: nil, expectedContentLength: 0, textEncodingName: nil))
        }
    }
}

enum ResponseType {
    case http(statusCode: Int)
    case url
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
            lhsResponse == rhsResponse
        case (.unauthorized(let lhsResponse), .unauthorized(let rhsResponse)):
            lhsResponse == rhsResponse
        case (.forbidden(let lhsResponse), .forbidden(let rhsResponse)):
            lhsResponse == rhsResponse
        case (.notFound(let lhsResponse), .notFound(let rhsResponse)):
            lhsResponse == rhsResponse
        case (.conflict(let lhsResponse), .conflict(let rhsResponse)):
            lhsResponse == rhsResponse
        case (.unprocessableEntity(let lhsResponse), .unprocessableEntity(let rhsResponse)):
            lhsResponse == rhsResponse
        case (.wrongDateFormat(let lhsDateString), .wrongDateFormat(let rhsDateString)):
            lhsDateString == rhsDateString
        case (.unknownHTTPError(let lhsStatusCode, let lhsData), .unknownHTTPError(let rhsStatusCode, let rhsData)):
            lhsStatusCode == rhsStatusCode && lhsData == rhsData
        case (.unknown(let lhsData), .unknown(let rhsData)):
            lhsData == rhsData
        default:
            fatalError("A error type is missing here.")
        }
    }
}

struct CrazyDatesResponse: Decodable {
    let date: Date
}

struct GzipResponse: BinaryResponse {
    let data: Data

    public static func from(data: Data) -> Self {
        Self(data: data)
    }
}

extension Request {
    static func getCrazyDates() -> Request<CrazyDatesResponse, ErrorResponse> {
        .init(path: "/v1/crazyDates", method: .get)
    }

    static func getAwesomeReports() -> Request<GzipResponse, ErrorResponse> {
        .init(path: "/v1/awesomeReports", method: .get)
    }
}
