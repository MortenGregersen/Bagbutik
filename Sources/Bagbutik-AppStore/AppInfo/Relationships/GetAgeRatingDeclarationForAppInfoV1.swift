import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read age rating declaration
     Get the age rating declaration for the app info.

     Responses for this endpoint include the `gamblingAndContests` attribute for legacy clients. For new clients, use `contents` or `gambling` properties instead. For example, in an app that has a `FREQUENT_OR_INTENSE` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gamblingAndContests` instead, the age rating for the `AppInfos` is 17+.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-ageRatingDeclaration>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAgeRatingDeclarationForAppInfoV1(id: String,
                                                    fields: [GetAgeRatingDeclarationForAppInfoV1.Field]? = nil) -> Request<AgeRatingDeclarationResponse, ErrorResponse>
    {
        .init(path: "/v1/appInfos/\(id)/ageRatingDeclaration", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAgeRatingDeclarationForAppInfoV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ageRatingDeclarations
        case ageRatingDeclarations([AgeRatingDeclarations])

        public enum AgeRatingDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingOverride
            case alcoholTobaccoOrDrugUseOrReferences
            case contests
            case gambling
            case gamblingAndContests
            case gamblingSimulated
            case horrorOrFearThemes
            case kidsAgeBand
            case koreaAgeRatingOverride
            case lootBox
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
