public extension Request {
    /**
      # Modify an IDFA Declaration
      Update your declared IDFA usage.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_idfa_declaration>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: IdfaDeclaration representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateIdfaDeclaration(id: String,
                                      requestBody: IdfaDeclarationUpdateRequest) -> Request<IdfaDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/idfaDeclarations/\(id)", method: .patch, requestBody: requestBody)
    }
}
