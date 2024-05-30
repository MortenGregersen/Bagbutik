import Bagbutik_Core
import Foundation

/**
 # AgeRatingDeclarationUpdateRequest
 The request body you use to update an Age Rating Declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest>
 */
public struct AgeRatingDeclarationUpdateRequest: Codable, RequestBody {
    /// The data element of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(Data.self, forKey: .data)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }

    /**
     # AgeRatingDeclarationUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "ageRatingDeclarations" }
        /// The attributes you change as part of the update request.
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
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
            case attributes
            case id
            case type
        }

        /**
         # AgeRatingDeclarationUpdateRequest.Data.Attributes
         Attributes whose values you're changing as part of the update request.

         For more information about app ratings, see [App ratings](https://help.apple.com/app-store-connect/#/dev269f11291).

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride?
            /// Declaration for alcohol, tobacco, or drug use.
            public var alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences?
            /// Declaration for contests.
            public var contests: AgeRatingDeclaration.Attributes.Contests?
            /// Declaration for gambling, provided as a Boolean value.
            public var gambling: Bool?
            /// Declaration for gambling or contests, as a Boolean value.
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var gamblingAndContests: Bool? = nil
            /// Declaration for simulated gambling.
            public var gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated?
            /// Declaration for horror or fear themed content.
            public var horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes?
            /// Declaration for the Kids Age Band value.
            public var kidsAgeBand: KidsAgeBand?
            /// Declaration for mature or suggestive themes.
            public var matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes?
            /// Declaration for medical or treatment-focused content.
            public var medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation?
            /// Declaration for profanity or crude humor.
            public var profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor?
            /// Declaration for a 17+ rating, provided as a Boolean value.
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var seventeenPlus: Bool? = nil
            /// Declaration for graphic sexual content and nudity.
            public var sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity?
            /// Declaration for sexual content or nudity.
            public var sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity?
            /// Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.
            public var unrestrictedWebAccess: Bool?
            /// Declaration for cartoon or fantasy violence.
            public var violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy?
            /// Declaration for realistic violence.
            public var violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic?
            /// Declaration for prolonged realistic or sadistic violence.
            public var violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride? = nil,
                        alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil,
                        contests: AgeRatingDeclaration.Attributes.Contests? = nil,
                        gambling: Bool? = nil,
                        gamblingAndContests: Bool? = nil,
                        gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil,
                        horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil,
                        kidsAgeBand: KidsAgeBand? = nil,
                        matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil,
                        medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil,
                        profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil,
                        seventeenPlus: Bool? = nil,
                        sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil,
                        sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil,
                        unrestrictedWebAccess: Bool? = nil,
                        violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil,
                        violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil,
                        violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil)
            {
                self.ageRatingOverride = ageRatingOverride
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

            public init(ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride? = nil,
                        alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil,
                        contests: AgeRatingDeclaration.Attributes.Contests? = nil,
                        gambling: Bool? = nil,
                        gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil,
                        horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil,
                        kidsAgeBand: KidsAgeBand? = nil,
                        matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil,
                        medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil,
                        profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil,
                        sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil,
                        sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil,
                        unrestrictedWebAccess: Bool? = nil,
                        violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil,
                        violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil,
                        violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil)
            {
                self.ageRatingOverride = ageRatingOverride
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.contests = contests
                self.gambling = gambling
                self.gamblingSimulated = gamblingSimulated
                self.horrorOrFearThemes = horrorOrFearThemes
                self.kidsAgeBand = kidsAgeBand
                self.matureOrSuggestiveThemes = matureOrSuggestiveThemes
                self.medicalOrTreatmentInformation = medicalOrTreatmentInformation
                self.profanityOrCrudeHumor = profanityOrCrudeHumor
                self.sexualContentGraphicAndNudity = sexualContentGraphicAndNudity
                self.sexualContentOrNudity = sexualContentOrNudity
                self.unrestrictedWebAccess = unrestrictedWebAccess
                self.violenceCartoonOrFantasy = violenceCartoonOrFantasy
                self.violenceRealistic = violenceRealistic
                self.violenceRealisticProlongedGraphicOrSadistic = violenceRealisticProlongedGraphicOrSadistic
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                ageRatingOverride = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AgeRatingOverride.self, forKey: .ageRatingOverride)
                alcoholTobaccoOrDrugUseOrReferences = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences.self, forKey: .alcoholTobaccoOrDrugUseOrReferences)
                contests = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.Contests.self, forKey: .contests)
                gambling = try container.decodeIfPresent(Bool.self, forKey: .gambling)
                gamblingAndContests = try container.decodeIfPresent(Bool.self, forKey: .gamblingAndContests)
                gamblingSimulated = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.GamblingSimulated.self, forKey: .gamblingSimulated)
                horrorOrFearThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.HorrorOrFearThemes.self, forKey: .horrorOrFearThemes)
                kidsAgeBand = try container.decodeIfPresent(KidsAgeBand.self, forKey: .kidsAgeBand)
                matureOrSuggestiveThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes.self, forKey: .matureOrSuggestiveThemes)
                medicalOrTreatmentInformation = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation.self, forKey: .medicalOrTreatmentInformation)
                profanityOrCrudeHumor = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor.self, forKey: .profanityOrCrudeHumor)
                seventeenPlus = try container.decodeIfPresent(Bool.self, forKey: .seventeenPlus)
                sexualContentGraphicAndNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity.self, forKey: .sexualContentGraphicAndNudity)
                sexualContentOrNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentOrNudity.self, forKey: .sexualContentOrNudity)
                unrestrictedWebAccess = try container.decodeIfPresent(Bool.self, forKey: .unrestrictedWebAccess)
                violenceCartoonOrFantasy = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy.self, forKey: .violenceCartoonOrFantasy)
                violenceRealistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealistic.self, forKey: .violenceRealistic)
                violenceRealisticProlongedGraphicOrSadistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic.self, forKey: .violenceRealisticProlongedGraphicOrSadistic)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(ageRatingOverride, forKey: .ageRatingOverride)
                try container.encodeIfPresent(alcoholTobaccoOrDrugUseOrReferences, forKey: .alcoholTobaccoOrDrugUseOrReferences)
                try container.encodeIfPresent(contests, forKey: .contests)
                try container.encodeIfPresent(gambling, forKey: .gambling)
                try container.encodeIfPresent(gamblingAndContests, forKey: .gamblingAndContests)
                try container.encodeIfPresent(gamblingSimulated, forKey: .gamblingSimulated)
                try container.encodeIfPresent(horrorOrFearThemes, forKey: .horrorOrFearThemes)
                try container.encodeIfPresent(kidsAgeBand, forKey: .kidsAgeBand)
                try container.encodeIfPresent(matureOrSuggestiveThemes, forKey: .matureOrSuggestiveThemes)
                try container.encodeIfPresent(medicalOrTreatmentInformation, forKey: .medicalOrTreatmentInformation)
                try container.encodeIfPresent(profanityOrCrudeHumor, forKey: .profanityOrCrudeHumor)
                try container.encodeIfPresent(seventeenPlus, forKey: .seventeenPlus)
                try container.encodeIfPresent(sexualContentGraphicAndNudity, forKey: .sexualContentGraphicAndNudity)
                try container.encodeIfPresent(sexualContentOrNudity, forKey: .sexualContentOrNudity)
                try container.encodeIfPresent(unrestrictedWebAccess, forKey: .unrestrictedWebAccess)
                try container.encodeIfPresent(violenceCartoonOrFantasy, forKey: .violenceCartoonOrFantasy)
                try container.encodeIfPresent(violenceRealistic, forKey: .violenceRealistic)
                try container.encodeIfPresent(violenceRealisticProlongedGraphicOrSadistic, forKey: .violenceRealisticProlongedGraphicOrSadistic)
            }

            private enum CodingKeys: String, CodingKey {
                case ageRatingOverride
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
}
