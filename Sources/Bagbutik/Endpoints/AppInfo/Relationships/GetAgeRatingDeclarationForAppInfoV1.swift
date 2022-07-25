public extension Request {
    /**
      # GET /v1/appInfos/{id}/ageRatingDeclaration
      Get the age rating declaration for the app info.

      Responses for this endpoint include the `gamblingAndContests` attribute for legacy clients. For new clients, use `contents` or `gambling` properties instead. For example, in an app that has a `FREQUENT_OR_INTENSE` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gamblingAndContests` instead, the age rating for the `AppInfos` is 17+.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_age_rating_declaration_for_an_app_info>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAgeRatingDeclarationForAppInfoV1(id: String,
                                                    fields: [GetAgeRatingDeclarationForAppInfoV1.Field]? = nil) -> Request<AgeRatingDeclarationResponse, ErrorResponse>
    {
        return .init(path: "/v1/appInfos/\(id)/ageRatingDeclaration", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAgeRatingDeclarationForAppInfoV1 {
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
