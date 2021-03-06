public extension Request {
    /**
      # Assign the App Encryption Declaration for a Build
      Assign an app encryption declaration to a build.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/assign_the_app_encryption_declaration_for_a_build>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: Related linkage
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAppEncryptionDeclarationForBuild(id: String,
                                                       requestBody: BuildAppEncryptionDeclarationLinkageRequest) -> Request<EmptyResponse, ErrorResponse>
    {
        return .init(path: "/v1/builds/\(id)/relationships/appEncryptionDeclaration", method: .patch, requestBody: requestBody)
    }
}
