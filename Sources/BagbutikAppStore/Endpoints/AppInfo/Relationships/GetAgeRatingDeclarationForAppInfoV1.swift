import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the age-rating declaration

     Get the age-rating declaration for an app info.

     ## Discussion

     Responses for this endpoint include `contests` or `gambling` properties. In an app that has a `FREQUENT_OR_INTENSE` declaration for contests, the age rating for the `AppInfos` is 12+. If you declare a value of true for `gambling`, the age rating for the `AppInfos` is 17+.

     ### Read the age-rating declaration

     **Request:**

     ```
     GET https://api.appstoreconnect.apple.com/v1/appInfos/994af4c0-ff6c-fdb9-e053-d23ab111187e/ageRatingDeclaration
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "ageRatingDeclarations",
         "id": "994af4c0-ff6c-fdb9-e053-d23ab111187e",
         "attributes": {
           "alcoholTobaccoOrDrugUseOrReferences": "NONE",
           "contests": "FREQUENT_OR_INTENSE",
           "gambling": false,
           "gamblingSimulated": "NONE",
           "kidsAgeBand": null,
           "medicalOrTreatmentInformation": "NONE",
           "profanityOrCrudeHumor": "NONE",
           "sexualContentGraphicAndNudity": "NONE",
           "sexualContentOrNudity": "NONE",
           "horrorOrFearThemes": "NONE",
           "matureOrSuggestiveThemes": "NONE",
           "unrestrictedWebAccess": false,
           "violenceCartoonOrFantasy": "NONE",
           "violenceRealisticProlongedGraphicOrSadistic": "NONE",
           "violenceRealistic": "NONE"
         },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/ageRatingDeclarations/994af4c0-ff6c-fdb9-e053-d23ab111187e"
       }
     },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/appInfos/994af4c0-ff6c-fdb9-e053-d23ab111187e/ageRatingDeclaration"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appInfos-_id_-ageRatingDeclaration>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAgeRatingDeclarationForAppInfoV1(id: String,
                                                    fields: [GetAgeRatingDeclarationForAppInfoV1.Field]? = nil) -> Request<AgeRatingDeclarationResponse, ErrorResponse> {
        .init(
            path: "/v1/appInfos/\(id)/ageRatingDeclaration",
            method: .get,
            parameters: .init(fields: fields))
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
            case advertising
            case ageAssurance
            case ageRatingOverride
            case ageRatingOverrideV2
            case alcoholTobaccoOrDrugUseOrReferences
            case contests
            case developerAgeRatingInfoUrl
            case gambling
            case gamblingSimulated
            case gracRatingClassificationNumber
            case gunsOrOtherWeapons
            case healthOrWellnessTopics
            case horrorOrFearThemes
            case kidsAgeBand
            case koreaAgeRatingOverride
            case lootBox
            case matureOrSuggestiveThemes
            case medicalOrTreatmentInformation
            case messagingAndChat
            case parentalControls
            case profanityOrCrudeHumor
            case sexualContentGraphicAndNudity
            case sexualContentOrNudity
            case socialMedia
            case socialMediaAgeRestricted
            case unrestrictedWebAccess
            case userGeneratedContent
            case violenceCartoonOrFantasy
            case violenceRealistic
            case violenceRealisticProlongedGraphicOrSadistic

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AgeRatingDeclarations(rawValue: string) {
                    self = value
                } else if let value = AgeRatingDeclarations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AgeRatingDeclarations value: \(string)"
                    )
                }
            }
        }
    }
}
