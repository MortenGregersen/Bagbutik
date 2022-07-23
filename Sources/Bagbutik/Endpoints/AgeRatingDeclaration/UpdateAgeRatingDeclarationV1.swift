public extension Request {
    /**
      # Modify an Age Rating Declaration
      Provide age-related information so the App Store can determine the age rating for your app.

      Every app store version has an age rating declaration. Use this endpoint to edit the declaration and provide app-characteristic information so App Store Connect can determine the appropriate age rating for the app.
      Use this endpoint to indicate whether an app is Made for Kids.
      When calling this endpoint, only include the attributes that you’re modifying.
      For example, in an app that has a `FREQUENT_OR_INTENSE` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gamblingAndContests` instead, the age rating for the `AppInfos` is 17+.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_age_rating_declaration>

      - Parameter id: The id of the requested resource
      - Parameter requestBody: AgeRatingDeclaration representation
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateAgeRatingDeclarationV1(id: String,
                                             requestBody: AgeRatingDeclarationUpdateRequest) -> Request<AgeRatingDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/ageRatingDeclarations/\(id)", method: .patch, requestBody: requestBody)
    }
}
