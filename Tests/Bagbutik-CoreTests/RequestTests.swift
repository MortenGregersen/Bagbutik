@testable import Bagbutik_Core
import XCTest

final class RequestTests: XCTestCase {
    let path = "some/path"
    let method = HTTPMethod.get

    func testAsUrlRequest_Plain() {
        let request = Request<Void, Void>(path: path, method: method)
        let urlRequest = request.asUrlRequest()
        XCTAssertEqual(urlRequest.url!.path, "/\(path)")
        XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
    }

    func testAsUrlRequest_Parameters() {
        let request = Request<Void, Void>(
            path: path,
            method: method,
            parameters: .init(
                fields: [Field.someField([.someField1])],
                filters: [Filter.otherFilter(["something"])],
                exists: [Exist.someExist(true), Exist.otherExist(false)],
                includes: [Include.other],
                sorts: [Sort.someAscending, Sort.otherDescending],
                limits: [Limit.limit(1), Limit.someLimit(2), Limit.otherLimit(3)]))
        let urlRequest = request.asUrlRequest()
        let urlComponents = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
        let queryItems = urlComponents!.queryItems!
        XCTAssertEqual(queryItems.count, 9)
        XCTAssertTrue(queryItems.contains(where: { $0.name == "fields[someField]" && $0.value == "someField1" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "filter[otherFilter]" && $0.value == "something" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "exists[someExist]" && $0.value == "true" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "exists[otherExist]" && $0.value == "false" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "include" && $0.value == "other" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "sort" && $0.value == "some,-other" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "limit" && $0.value == "1" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "limit[someLimit]" && $0.value == "2" }))
        XCTAssertTrue(queryItems.contains(where: { $0.name == "limit[otherLimit]" && $0.value == "3" }))
    }

    func testAsUrlRequest_Limit() {
        let request = Request<Void, Void>(path: path, method: method, parameters: .init(limit: 42))
        let urlRequest = request.asUrlRequest()
        let urlComponents = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)
        let queryItems = urlComponents!.queryItems!
        XCTAssertEqual(queryItems.count, 1)
        XCTAssertTrue(queryItems.contains(where: { $0.name == "limit" && $0.value == "42" }))
    }

    func testAsUrlRequest_Body() {
        let requestBody = Body(anything: "something")
        let request = Request<Void, Void>(path: path, method: method, requestBody: requestBody)
        let urlRequest = request.asUrlRequest()
        XCTAssertEqual(urlRequest.httpBody, requestBody.jsonData)
        XCTAssertTrue(urlRequest.allHTTPHeaderFields?.contains(where: { (key: String, value: String) in
            key == "Content-Type" && value == "application/json"
        }) ?? false)
    }
}

private struct Body: RequestBody {
    let anything: String
}

private enum Field: FieldParameter {
    case someField([SomeField]), otherField([OtherField])

    public enum SomeField: String, ParameterValue, CaseIterable {
        case someField1, someField2
    }

    public enum OtherField: String, ParameterValue, CaseIterable {
        case otherField1, otherField2
    }
}

private enum Filter: FilterParameter {
    case someFilter([String]), otherFilter([String])
}

private enum Exist: ExistParameter {
    case someExist(Bool)
    case otherExist(Bool)
}

private enum Include: String, IncludeParameter {
    case some, other
}

private enum Sort: String, SortParameter {
    case someAscending = "some"
    case someDescending = "-some"
    case otherAscending = "other"
    case otherDescending = "-other"
}

private enum Limit: LimitParameter {
    case limit(Int)
    case someLimit(Int)
    case otherLimit(Int)
}
