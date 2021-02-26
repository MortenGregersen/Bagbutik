public extension Request {
    /**
      # Create an IDFA Declaration
      Declare the IDFA usage for an App Store version.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/create_an_idfa_declaration>

      - Parameter requestBody: IdfaDeclaration representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func createIdfaDeclaration(requestBody: IdfaDeclarationCreateRequest) -> Request<IdfaDeclarationResponse, ErrorResponse> {
        return .init(path: "/v1/idfaDeclarations", method: .post, requestBody: requestBody)
    }
}
