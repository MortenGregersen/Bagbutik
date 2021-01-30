public extension Request {
    /**
      # Assign Builds to an App Encryption Declaration
      Assign one or more builds to an app encryption declaration.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/assign_builds_to_an_app_encryption_declaration>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createBuildsForAppEncryptionDeclaration(id: String,
                                                        requestBody: AppEncryptionDeclarationBuildsLinkagesRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/appEncryptionDeclarations/\(id)/relationships/builds", method: .post, requestBody: requestBody)
    }
}
