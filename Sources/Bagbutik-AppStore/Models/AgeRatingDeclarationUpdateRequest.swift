import Bagbutik_Core
import Bagbutik_Models
import Foundation

/**
 # AgeRatingDeclarationUpdateRequest
 The request body you use to update an Age Rating Declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclarationupdaterequest>
 */
public struct AgeRatingDeclarationUpdateRequest: Codable, Sendable, RequestBody {
    /// The data element of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable, Sendable, Identifiable {
        public let id: String
        public var type: String { "ageRatingDeclarations" }
        public var attributes: Attributes?

        public init(id: String,
                    attributes: Attributes? = nil)
        {
            self.id = id
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public var ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride?
            public var alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences?
            public var contests: AgeRatingDeclaration.Attributes.Contests?
            public var gambling: Bool?
            public var gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated?
            public var horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes?
            public var kidsAgeBand: Clearable<KidsAgeBand>?
            public var koreaAgeRatingOverride: AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride?
            public var lootBox: Bool?
            public var matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes?
            public var medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation?
            public var profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor?
            public var sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity?
            public var sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity?
            public var unrestrictedWebAccess: Bool?
            public var violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy?
            public var violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic?
            public var violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic?

            public init(ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride? = nil,
                        alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil,
                        contests: AgeRatingDeclaration.Attributes.Contests? = nil,
                        gambling: Bool? = nil,
                        gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil,
                        horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil,
                        kidsAgeBand: Clearable<KidsAgeBand>? = nil,
                        koreaAgeRatingOverride: AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride? = nil,
                        lootBox: Bool? = nil,
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
                self.koreaAgeRatingOverride = koreaAgeRatingOverride
                self.lootBox = lootBox
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
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                ageRatingOverride = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AgeRatingOverride.self, forKey: "ageRatingOverride")
                alcoholTobaccoOrDrugUseOrReferences = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences.self, forKey: "alcoholTobaccoOrDrugUseOrReferences")
                contests = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.Contests.self, forKey: "contests")
                gambling = try container.decodeIfPresent(Bool.self, forKey: "gambling")
                gamblingSimulated = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.GamblingSimulated.self, forKey: "gamblingSimulated")
                horrorOrFearThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.HorrorOrFearThemes.self, forKey: "horrorOrFearThemes")
                kidsAgeBand = try container.decodeIfPresent(Clearable<KidsAgeBand>.self, forKey: "kidsAgeBand")
                koreaAgeRatingOverride = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride.self, forKey: "koreaAgeRatingOverride")
                lootBox = try container.decodeIfPresent(Bool.self, forKey: "lootBox")
                matureOrSuggestiveThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes.self, forKey: "matureOrSuggestiveThemes")
                medicalOrTreatmentInformation = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation.self, forKey: "medicalOrTreatmentInformation")
                profanityOrCrudeHumor = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor.self, forKey: "profanityOrCrudeHumor")
                sexualContentGraphicAndNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity.self, forKey: "sexualContentGraphicAndNudity")
                sexualContentOrNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentOrNudity.self, forKey: "sexualContentOrNudity")
                unrestrictedWebAccess = try container.decodeIfPresent(Bool.self, forKey: "unrestrictedWebAccess")
                violenceCartoonOrFantasy = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy.self, forKey: "violenceCartoonOrFantasy")
                violenceRealistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealistic.self, forKey: "violenceRealistic")
                violenceRealisticProlongedGraphicOrSadistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic.self, forKey: "violenceRealisticProlongedGraphicOrSadistic")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(ageRatingOverride, forKey: "ageRatingOverride")
                try container.encodeIfPresent(alcoholTobaccoOrDrugUseOrReferences, forKey: "alcoholTobaccoOrDrugUseOrReferences")
                try container.encodeIfPresent(contests, forKey: "contests")
                try container.encodeIfPresent(gambling, forKey: "gambling")
                try container.encodeIfPresent(gamblingSimulated, forKey: "gamblingSimulated")
                try container.encodeIfPresent(horrorOrFearThemes, forKey: "horrorOrFearThemes")
                try container.encodeIfPresent(kidsAgeBand, forKey: "kidsAgeBand")
                try container.encodeIfPresent(koreaAgeRatingOverride, forKey: "koreaAgeRatingOverride")
                try container.encodeIfPresent(lootBox, forKey: "lootBox")
                try container.encodeIfPresent(matureOrSuggestiveThemes, forKey: "matureOrSuggestiveThemes")
                try container.encodeIfPresent(medicalOrTreatmentInformation, forKey: "medicalOrTreatmentInformation")
                try container.encodeIfPresent(profanityOrCrudeHumor, forKey: "profanityOrCrudeHumor")
                try container.encodeIfPresent(sexualContentGraphicAndNudity, forKey: "sexualContentGraphicAndNudity")
                try container.encodeIfPresent(sexualContentOrNudity, forKey: "sexualContentOrNudity")
                try container.encodeIfPresent(unrestrictedWebAccess, forKey: "unrestrictedWebAccess")
                try container.encodeIfPresent(violenceCartoonOrFantasy, forKey: "violenceCartoonOrFantasy")
                try container.encodeIfPresent(violenceRealistic, forKey: "violenceRealistic")
                try container.encodeIfPresent(violenceRealisticProlongedGraphicOrSadistic, forKey: "violenceRealisticProlongedGraphicOrSadistic")
            }
        }
    }
}
