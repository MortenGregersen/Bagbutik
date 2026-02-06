import Foundation
#if canImport(FoundationNetworking)
// Non-Apple platform support
import FoundationNetworking
#endif

private let baseUrl = URL(string: "https://api.appstoreconnect.apple.com")!

/// A description of a request. This will internally be mapped to a real URL request.
public struct Request<ResponseType, ErrorResponseType>: Sendable {
    /// The path of the endpoint.
    public let path: String
    /// The HTTP method to use for the request.
    public let method: HTTPMethod
    /// The parameters to add to the query.
    public let parameters: Parameters?
    /// The request body to send with the request.
    public let requestBody: RequestBody?

    /**
     Create a new description of a request.

     - Parameters:
        - path: The path of the endpoint.
        - method: The HTTP method to use for the request.
        - parameters: The parameters to add to the query.
        - requestBody: The request body to send with the request.
      */
    public init(path: String, method: HTTPMethod, parameters: Parameters? = nil, requestBody: RequestBody? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.requestBody = requestBody
    }

    internal func asUrlRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.path = path
        if let parameters = parameters {
            var parametersDict = [String: String]()
            parameters.fields?.forEach { parametersDict["fields[\($0.caseName)]"] = $0.value }
            parameters.filters?.forEach { parametersDict["filter[\($0.caseName)]"] = $0.value }
            parameters.exists?.forEach { parametersDict["exists[\($0.caseName)]"] = $0.value ? "true" : "false" }
            if let include = parameters.includes { parametersDict["include"] = include.map(\.caseName).joinedByCommas() }
            if let sort = parameters.sorts { parametersDict["sort"] = sort.map(\.value).joinedByCommas() }
            parameters.limits?.forEach {
                let key: String
                if $0.caseName == "limit" {
                    key = "limit"
                } else {
                    key = "limit[\($0.caseName)]"
                }
                parametersDict[key] = "\($0.value)"
            }
            if let limit = parameters.limit { parametersDict["limit"] = "\(limit)" }
            urlComponents.queryItems = parametersDict.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        let url = urlComponents.url(relativeTo: baseUrl)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        if let requestBody = requestBody {
            urlRequest.httpBody = try requestBody.jsonData()
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}
