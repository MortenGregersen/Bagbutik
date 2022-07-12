public extension Request {
    /**
      # Delete an IDFA Declaration
      Delete the IDFA declaration that is associated with a version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_idfa_declaration>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteIdfaDeclarationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/idfaDeclarations/\(id)", method: .delete)
    }
}
