public extension Request {
    /**
      # Delete an IDFA Declaration
      Delete the IDFA declaration that is associated with a version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_idfa_declaration>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteIdfaDeclaration(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/idfaDeclarations/\(id)", method: .delete)
    }
}
