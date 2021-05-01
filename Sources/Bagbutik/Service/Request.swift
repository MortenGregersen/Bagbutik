import Foundation

public struct Request<ResponseType, ErrorResponseType> {
    static var baseUrl: URL { URL(string: "https://api.appstoreconnect.apple.com")! }
    let path: String
    let method: HTTPMethod
    let parameters: Parameters?
    let requestBody: RequestBody?
    
    init(path: String, method: HTTPMethod, parameters: Parameters? = nil, requestBody: RequestBody? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.requestBody = requestBody
    }
    
    public func asUrlRequest(withSignedJwt signedJwt: String) -> URLRequest {
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
        let url = urlComponents.url(relativeTo: Self.baseUrl)!
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer \(signedJwt)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = method.rawValue
        if let requestBody = requestBody {
            urlRequest.httpBody = requestBody.jsonData
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return urlRequest
    }
}
