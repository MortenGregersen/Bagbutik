public extension Request {
    enum GetAgeRatingDeclarationForAppInfo {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type ageRatingDeclarations
            case ageRatingDeclarations([AgeRatingDeclarations])

            public enum AgeRatingDeclarations: String, ParameterValue, CaseIterable {
                case alcoholTobaccoOrDrugUseOrReferences
                case contests
                case gambling
                case gamblingAndContests
                case gamblingSimulated
                case horrorOrFearThemes
                case kidsAgeBand
                case matureOrSuggestiveThemes
                case medicalOrTreatmentInformation
                case profanityOrCrudeHumor
                case seventeenPlus
                case sexualContentGraphicAndNudity
                case sexualContentOrNudity
                case unrestrictedWebAccess
                case violenceCartoonOrFantasy
                case violenceRealistic
                case violenceRealisticProlongedGraphicOrSadistic
            }
        }
    }

    /**
      # Read the Age Rating Declaration for an App Info
      Get the age rating declaration for the app info.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_age_rating_declaration_for_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAgeRatingDeclarationForAppInfo(id: String,
                                                  fields: [GetAgeRatingDeclarationForAppInfo.Field]? = nil) -> Request<AgeRatingDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/ageRatingDeclaration", method: .get, parameters: .init(fields: fields))
    }
}
