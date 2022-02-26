internal func createDocumentationUrl(forSchemaNamed name: String, withCodingPathComponents codingPathComponents: [String]) -> String {
    var urlPathComponents = codingPathComponents
        .filter { $0 != "Items" &&
            $0 != "Source" &&
            $0 != "OneOf" &&
            !$0.hasPrefix("Index ")
        }
    if urlPathComponents.last != name {
        urlPathComponents.append(name.lowercased())
    }
    let uri = urlPathComponents
        .map { $0.lowercased() }
        .joined(separator: "/")
    return "https://developer.apple.com/documentation/appstoreconnectapi/\(uri)"
}
