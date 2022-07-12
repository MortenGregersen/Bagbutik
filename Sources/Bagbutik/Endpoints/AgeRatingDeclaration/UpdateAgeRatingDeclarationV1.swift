public extension Request {
    /**
      # Modify an Age Rating Declaration
      Provide age-related information so the App Store can determine the age rating for your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_age_rating_declaration>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AgeRatingDeclaration representation
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func updateAgeRatingDeclarationV1(id: String,
                                             requestBody: AgeRatingDeclarationUpdateRequest) -> Request<AgeRatingDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/ageRatingDeclarations/\(id)", method: .patch, requestBody: requestBody)
    }
}
