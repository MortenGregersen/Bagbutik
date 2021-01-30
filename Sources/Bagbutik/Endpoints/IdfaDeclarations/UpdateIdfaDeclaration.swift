public extension Request {
    /**
      # Modify an IDFA Declaration
      Update your declared IDFA usage.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_idfa_declaration>

      - Parameter id: An opaque resource ID that uniquely identifies the resource
      - Parameter requestBody: The data for the request
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateIdfaDeclaration(id: String,
                                      requestBody: IdfaDeclarationUpdateRequest) -> Request<IdfaDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/idfaDeclarations/\(id)", method: .patch, requestBody: requestBody)
    }
}
