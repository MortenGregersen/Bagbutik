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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// Declaration for alcohol, tobacco, or drug use.
            @NullCodable public var alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences?
            /// Declaration for contests.
            @NullCodable public var contests: AgeRatingDeclaration.Attributes.Contests?
            /// Declaration for gambling, provided as a Boolean value.
            public var gambling: Bool?
            /// Declaration for gambling or contests, as a Boolean value.
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var gamblingAndContests: Bool? = nil
            /// Declaration for simulated gambling.
            @NullCodable public var gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated?
            /// Declaration for horror or fear themed content.
            @NullCodable public var horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes?
            /// Declaration for the Kids Age Band value.
            @NullCodable public var kidsAgeBand: KidsAgeBand?
            /// Declaration for mature or suggestive themes.
            @NullCodable public var matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes?
            /// Declaration for medical or treatment-focused content.
            @NullCodable public var medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation?
            /// Declaration for profanity or crude humor.
            @NullCodable public var profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor?
            /// Declaration for a 17+ rating, provided as a Boolean value.
            public var seventeenPlus: Bool?
            /// Declaration for graphic sexual content and nudity.
            @NullCodable public var sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity?
            /// Declaration for sexual content or nudity.
            @NullCodable public var sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity?
            /// Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.
            public var unrestrictedWebAccess: Bool?
            /// Declaration for cartoon or fantasy violence.
            @NullCodable public var violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy?
            /// Declaration for realistic violence.
            @NullCodable public var violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic?
            /// Declaration for prolonged realistic or sadistic violence.
            @NullCodable public var violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic?

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
