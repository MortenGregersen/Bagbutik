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
            public var advertising: Bool?
            public var ageAssurance: Bool?
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride? = nil
            public var ageRatingOverrideV2: AgeRatingDeclaration.Attributes.AgeRatingOverrideV2?
            public var alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences?
            public var contests: AgeRatingDeclaration.Attributes.Contests?
            public var developerAgeRatingInfoUrl: String?
            public var gambling: Bool?
            public var gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated?
            public var gunsOrOtherWeapons: AgeRatingDeclaration.Attributes.GunsOrOtherWeapons?
            public var healthOrWellnessTopics: Bool?
            public var horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes?
            public var kidsAgeBand: Clearable<KidsAgeBand>?
            public var koreaAgeRatingOverride: AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride?
            public var lootBox: Bool?
            public var matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes?
            public var medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation?
            public var messagingAndChat: Bool?
            public var parentalControls: Bool?
            public var profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor?
            public var sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity?
            public var sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity?
            public var unrestrictedWebAccess: Bool?
            public var userGeneratedContent: Bool?
            public var violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy?
            public var violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic?
            public var violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(advertising: Bool? = nil,
                        ageAssurance: Bool? = nil,
                        ageRatingOverride: AgeRatingDeclaration.Attributes.AgeRatingOverride? = nil,
                        ageRatingOverrideV2: AgeRatingDeclaration.Attributes.AgeRatingOverrideV2? = nil,
                        alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil,
                        contests: AgeRatingDeclaration.Attributes.Contests? = nil,
                        developerAgeRatingInfoUrl: String? = nil,
                        gambling: Bool? = nil,
                        gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil,
                        gunsOrOtherWeapons: AgeRatingDeclaration.Attributes.GunsOrOtherWeapons? = nil,
                        healthOrWellnessTopics: Bool? = nil,
                        horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil,
                        kidsAgeBand: Clearable<KidsAgeBand>? = nil,
                        koreaAgeRatingOverride: AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride? = nil,
                        lootBox: Bool? = nil,
                        matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil,
                        medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil,
                        messagingAndChat: Bool? = nil,
                        parentalControls: Bool? = nil,
                        profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil,
                        sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil,
                        sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil,
                        unrestrictedWebAccess: Bool? = nil,
                        userGeneratedContent: Bool? = nil,
                        violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil,
                        violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil,
                        violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil)
            {
                self.advertising = advertising
                self.ageAssurance = ageAssurance
                self.ageRatingOverride = ageRatingOverride
                self.ageRatingOverrideV2 = ageRatingOverrideV2
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.contests = contests
                self.developerAgeRatingInfoUrl = developerAgeRatingInfoUrl
                self.gambling = gambling
                self.gamblingSimulated = gamblingSimulated
                self.gunsOrOtherWeapons = gunsOrOtherWeapons
                self.healthOrWellnessTopics = healthOrWellnessTopics
                self.horrorOrFearThemes = horrorOrFearThemes
                self.kidsAgeBand = kidsAgeBand
                self.koreaAgeRatingOverride = koreaAgeRatingOverride
                self.lootBox = lootBox
                self.matureOrSuggestiveThemes = matureOrSuggestiveThemes
                self.medicalOrTreatmentInformation = medicalOrTreatmentInformation
                self.messagingAndChat = messagingAndChat
                self.parentalControls = parentalControls
                self.profanityOrCrudeHumor = profanityOrCrudeHumor
                self.sexualContentGraphicAndNudity = sexualContentGraphicAndNudity
                self.sexualContentOrNudity = sexualContentOrNudity
                self.unrestrictedWebAccess = unrestrictedWebAccess
                self.userGeneratedContent = userGeneratedContent
                self.violenceCartoonOrFantasy = violenceCartoonOrFantasy
                self.violenceRealistic = violenceRealistic
                self.violenceRealisticProlongedGraphicOrSadistic = violenceRealisticProlongedGraphicOrSadistic
            }

            public init(advertising: Bool? = nil,
                        ageAssurance: Bool? = nil,
                        ageRatingOverrideV2: AgeRatingDeclaration.Attributes.AgeRatingOverrideV2? = nil,
                        alcoholTobaccoOrDrugUseOrReferences: AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences? = nil,
                        contests: AgeRatingDeclaration.Attributes.Contests? = nil,
                        developerAgeRatingInfoUrl: String? = nil,
                        gambling: Bool? = nil,
                        gamblingSimulated: AgeRatingDeclaration.Attributes.GamblingSimulated? = nil,
                        gunsOrOtherWeapons: AgeRatingDeclaration.Attributes.GunsOrOtherWeapons? = nil,
                        healthOrWellnessTopics: Bool? = nil,
                        horrorOrFearThemes: AgeRatingDeclaration.Attributes.HorrorOrFearThemes? = nil,
                        kidsAgeBand: Clearable<KidsAgeBand>? = nil,
                        koreaAgeRatingOverride: AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride? = nil,
                        lootBox: Bool? = nil,
                        matureOrSuggestiveThemes: AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes? = nil,
                        medicalOrTreatmentInformation: AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation? = nil,
                        messagingAndChat: Bool? = nil,
                        parentalControls: Bool? = nil,
                        profanityOrCrudeHumor: AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor? = nil,
                        sexualContentGraphicAndNudity: AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity? = nil,
                        sexualContentOrNudity: AgeRatingDeclaration.Attributes.SexualContentOrNudity? = nil,
                        unrestrictedWebAccess: Bool? = nil,
                        userGeneratedContent: Bool? = nil,
                        violenceCartoonOrFantasy: AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy? = nil,
                        violenceRealistic: AgeRatingDeclaration.Attributes.ViolenceRealistic? = nil,
                        violenceRealisticProlongedGraphicOrSadistic: AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic? = nil)
            {
                self.advertising = advertising
                self.ageAssurance = ageAssurance
                self.ageRatingOverrideV2 = ageRatingOverrideV2
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.contests = contests
                self.developerAgeRatingInfoUrl = developerAgeRatingInfoUrl
                self.gambling = gambling
                self.gamblingSimulated = gamblingSimulated
                self.gunsOrOtherWeapons = gunsOrOtherWeapons
                self.healthOrWellnessTopics = healthOrWellnessTopics
                self.horrorOrFearThemes = horrorOrFearThemes
                self.kidsAgeBand = kidsAgeBand
                self.koreaAgeRatingOverride = koreaAgeRatingOverride
                self.lootBox = lootBox
                self.matureOrSuggestiveThemes = matureOrSuggestiveThemes
                self.medicalOrTreatmentInformation = medicalOrTreatmentInformation
                self.messagingAndChat = messagingAndChat
                self.parentalControls = parentalControls
                self.profanityOrCrudeHumor = profanityOrCrudeHumor
                self.sexualContentGraphicAndNudity = sexualContentGraphicAndNudity
                self.sexualContentOrNudity = sexualContentOrNudity
                self.unrestrictedWebAccess = unrestrictedWebAccess
                self.userGeneratedContent = userGeneratedContent
                self.violenceCartoonOrFantasy = violenceCartoonOrFantasy
                self.violenceRealistic = violenceRealistic
                self.violenceRealisticProlongedGraphicOrSadistic = violenceRealisticProlongedGraphicOrSadistic
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                advertising = try container.decodeIfPresent(Bool.self, forKey: "advertising")
                ageAssurance = try container.decodeIfPresent(Bool.self, forKey: "ageAssurance")
                ageRatingOverride = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AgeRatingOverride.self, forKey: "ageRatingOverride")
                ageRatingOverrideV2 = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AgeRatingOverrideV2.self, forKey: "ageRatingOverrideV2")
                alcoholTobaccoOrDrugUseOrReferences = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.AlcoholTobaccoOrDrugUseOrReferences.self, forKey: "alcoholTobaccoOrDrugUseOrReferences")
                contests = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.Contests.self, forKey: "contests")
                developerAgeRatingInfoUrl = try container.decodeIfPresent(String.self, forKey: "developerAgeRatingInfoUrl")
                gambling = try container.decodeIfPresent(Bool.self, forKey: "gambling")
                gamblingSimulated = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.GamblingSimulated.self, forKey: "gamblingSimulated")
                gunsOrOtherWeapons = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.GunsOrOtherWeapons.self, forKey: "gunsOrOtherWeapons")
                healthOrWellnessTopics = try container.decodeIfPresent(Bool.self, forKey: "healthOrWellnessTopics")
                horrorOrFearThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.HorrorOrFearThemes.self, forKey: "horrorOrFearThemes")
                kidsAgeBand = try container.decodeIfPresent(Clearable<KidsAgeBand>.self, forKey: "kidsAgeBand")
                koreaAgeRatingOverride = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.KoreaAgeRatingOverride.self, forKey: "koreaAgeRatingOverride")
                lootBox = try container.decodeIfPresent(Bool.self, forKey: "lootBox")
                matureOrSuggestiveThemes = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MatureOrSuggestiveThemes.self, forKey: "matureOrSuggestiveThemes")
                medicalOrTreatmentInformation = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.MedicalOrTreatmentInformation.self, forKey: "medicalOrTreatmentInformation")
                messagingAndChat = try container.decodeIfPresent(Bool.self, forKey: "messagingAndChat")
                parentalControls = try container.decodeIfPresent(Bool.self, forKey: "parentalControls")
                profanityOrCrudeHumor = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ProfanityOrCrudeHumor.self, forKey: "profanityOrCrudeHumor")
                sexualContentGraphicAndNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentGraphicAndNudity.self, forKey: "sexualContentGraphicAndNudity")
                sexualContentOrNudity = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.SexualContentOrNudity.self, forKey: "sexualContentOrNudity")
                unrestrictedWebAccess = try container.decodeIfPresent(Bool.self, forKey: "unrestrictedWebAccess")
                userGeneratedContent = try container.decodeIfPresent(Bool.self, forKey: "userGeneratedContent")
                violenceCartoonOrFantasy = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceCartoonOrFantasy.self, forKey: "violenceCartoonOrFantasy")
                violenceRealistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealistic.self, forKey: "violenceRealistic")
                violenceRealisticProlongedGraphicOrSadistic = try container.decodeIfPresent(AgeRatingDeclaration.Attributes.ViolenceRealisticProlongedGraphicOrSadistic.self, forKey: "violenceRealisticProlongedGraphicOrSadistic")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(advertising, forKey: "advertising")
                try container.encodeIfPresent(ageAssurance, forKey: "ageAssurance")
                try container.encodeIfPresent(ageRatingOverride, forKey: "ageRatingOverride")
                try container.encodeIfPresent(ageRatingOverrideV2, forKey: "ageRatingOverrideV2")
                try container.encodeIfPresent(alcoholTobaccoOrDrugUseOrReferences, forKey: "alcoholTobaccoOrDrugUseOrReferences")
                try container.encodeIfPresent(contests, forKey: "contests")
                try container.encodeIfPresent(developerAgeRatingInfoUrl, forKey: "developerAgeRatingInfoUrl")
                try container.encodeIfPresent(gambling, forKey: "gambling")
                try container.encodeIfPresent(gamblingSimulated, forKey: "gamblingSimulated")
                try container.encodeIfPresent(gunsOrOtherWeapons, forKey: "gunsOrOtherWeapons")
                try container.encodeIfPresent(healthOrWellnessTopics, forKey: "healthOrWellnessTopics")
                try container.encodeIfPresent(horrorOrFearThemes, forKey: "horrorOrFearThemes")
                try container.encodeIfPresent(kidsAgeBand, forKey: "kidsAgeBand")
                try container.encodeIfPresent(koreaAgeRatingOverride, forKey: "koreaAgeRatingOverride")
                try container.encodeIfPresent(lootBox, forKey: "lootBox")
                try container.encodeIfPresent(matureOrSuggestiveThemes, forKey: "matureOrSuggestiveThemes")
                try container.encodeIfPresent(medicalOrTreatmentInformation, forKey: "medicalOrTreatmentInformation")
                try container.encodeIfPresent(messagingAndChat, forKey: "messagingAndChat")
                try container.encodeIfPresent(parentalControls, forKey: "parentalControls")
                try container.encodeIfPresent(profanityOrCrudeHumor, forKey: "profanityOrCrudeHumor")
                try container.encodeIfPresent(sexualContentGraphicAndNudity, forKey: "sexualContentGraphicAndNudity")
                try container.encodeIfPresent(sexualContentOrNudity, forKey: "sexualContentOrNudity")
                try container.encodeIfPresent(unrestrictedWebAccess, forKey: "unrestrictedWebAccess")
                try container.encodeIfPresent(userGeneratedContent, forKey: "userGeneratedContent")
                try container.encodeIfPresent(violenceCartoonOrFantasy, forKey: "violenceCartoonOrFantasy")
                try container.encodeIfPresent(violenceRealistic, forKey: "violenceRealistic")
                try container.encodeIfPresent(violenceRealisticProlongedGraphicOrSadistic, forKey: "violenceRealisticProlongedGraphicOrSadistic")
            }
        }
    }
}
