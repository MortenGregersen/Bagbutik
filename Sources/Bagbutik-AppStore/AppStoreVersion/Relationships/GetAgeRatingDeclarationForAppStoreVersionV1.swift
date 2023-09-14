import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Age Rating Declaration Information of an App Store Version
     Get the age-related information declared for your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_age_rating_declaration_information_of_an_app_store_version>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func getAgeRatingDeclarationForAppStoreVersionV1(id: String,
                                                            fields: [GetAgeRatingDeclarationForAppStoreVersionV1.Field]? = nil) -> Request<AgeRatingDeclarationWithoutIncludesResponse, ErrorResponse>
    {
        .init(path: "/v1/appStoreVersions/\(id)/ageRatingDeclaration", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetAgeRatingDeclarationForAppStoreVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type ageRatingDeclarations
        case ageRatingDeclarations([AgeRatingDeclarations])

        public enum AgeRatingDeclarations: String, ParameterValue, Codable, CaseIterable {
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
