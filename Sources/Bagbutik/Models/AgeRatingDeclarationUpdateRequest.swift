import Foundation

/**
 The request body you use to update an Age Rating Declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest>
 */
public struct AgeRatingDeclarationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "ageRatingDeclarations" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// Declaration for alcohol, tobacco, or drug use.
            public let alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences?
            /// Declaration for contests.
            public let contests: AgeRatingDeclaration.Attributes.Contests?
            /// Declaration for gambling, provided as a Boolean value.
            public let gambling: Bool?
            /// Declaration for gambling or contests, as a Boolean value.
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var gamblingAndContests: Bool? = nil
            /// Declaration for simulated gambling.
            public let gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated?
            /// Declaration for horror or fear themed content.
            public let horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes?
            /// Declaration for the Kids Age Band value.
            public let kidsAgeBand: KidsAgeBand?
            /// Declaration for mature or suggestive themes.
            public let matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes?
            /// Declaration for medical or treatment-focused content.
            public let medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation?
            /// Declaration for profanity or crude humor.
            public let profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor?
            /// Declaration for a 17+ rating, provided as a Boolean value.
            public let seventeenPlus: Bool?
            /// Declaration for graphic sexual content and nudity.
            public let sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity?
            /// Declaration for sexual content or nudity.
            public let sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity?
            /// Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.
            public let unrestrictedWebAccess: Bool?
            /// Declaration for cartoon or fantasy violence.
            public let violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy?
            /// Declaration for realistic violence.
            public let violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic?
            /// Declaration for prolonged realistic or sadistic violence.
            public let violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil, contests: AgeRatingDeclaration.Attributes.Contests? = nil, gambling: Bool? = nil, gamblingAndContests: Bool? = nil, gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil, horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil, kidsAgeBand: KidsAgeBand? = nil, matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil, medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil, profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil, seventeenPlus: Bool? = nil, sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil, sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil, unrestrictedWebAccess: Bool? = nil, violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil, violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil, violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil) {
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.contests = contests
                self.gambling = gambling
                self.gamblingAndContests = gamblingAndContests
                self.gamblingSimulated = gamblingSimulated
                self.horrorOrFearThemes = horrorOrFearThemes
                self.kidsAgeBand = kidsAgeBand
                self.matureOrSuggestiveThemes = matureOrSuggestiveThemes
                self.medicalOrTreatmentInformation = medicalOrTreatmentInformation
                self.profanityOrCrudeHumor = profanityOrCrudeHumor
                self.seventeenPlus = seventeenPlus
                self.sexualContentGraphicAndNudity = sexualContentGraphicAndNudity
                self.sexualContentOrNudity = sexualContentOrNudity
                self.unrestrictedWebAccess = unrestrictedWebAccess
                self.violenceCartoonOrFantasy = violenceCartoonOrFantasy
                self.violenceRealistic = violenceRealistic
                self.violenceRealisticProlongedGraphicOrSadistic = violenceRealisticProlongedGraphicOrSadistic
            }

            public init(alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil, contests: AgeRatingDeclaration.Attributes.Contests? = nil, gambling: Bool? = nil, gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil, horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil, kidsAgeBand: KidsAgeBand? = nil, matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil, medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil, profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil, seventeenPlus: Bool? = nil, sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil, sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil, unrestrictedWebAccess: Bool? = nil, violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil, violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil, violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil) {
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.contests = contests
                self.gambling = gambling
                self.gamblingSimulated = gamblingSimulated
                self.horrorOrFearThemes = horrorOrFearThemes
                self.kidsAgeBand = kidsAgeBand
                self.matureOrSuggestiveThemes = matureOrSuggestiveThemes
                self.medicalOrTreatmentInformation = medicalOrTreatmentInformation
                self.profanityOrCrudeHumor = profanityOrCrudeHumor
                self.seventeenPlus = seventeenPlus
                self.sexualContentGraphicAndNudity = sexualContentGraphicAndNudity
                self.sexualContentOrNudity = sexualContentOrNudity
                self.unrestrictedWebAccess = unrestrictedWebAccess
                self.violenceCartoonOrFantasy = violenceCartoonOrFantasy
                self.violenceRealistic = violenceRealistic
                self.violenceRealisticProlongedGraphicOrSadistic = violenceRealisticProlongedGraphicOrSadistic
            }
        }
    }
}
