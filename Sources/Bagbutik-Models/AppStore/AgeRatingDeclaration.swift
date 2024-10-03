import Bagbutik_Core
import Foundation

public struct AgeRatingDeclaration: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "ageRatingDeclarations" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var ageRatingOverride: AgeRatingOverride?
        public var alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences?
        public var contests: Contests?
        public var gambling: Bool?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var gamblingAndContests: Bool? = nil
        public var gamblingSimulated: GamblingSimulated?
        public var horrorOrFearThemes: HorrorOrFearThemes?
        public var kidsAgeBand: KidsAgeBand?
        public var koreaAgeRatingOverride: KoreaAgeRatingOverride?
        public var lootBox: Bool?
        public var matureOrSuggestiveThemes: MatureOrSuggestiveThemes?
        public var medicalOrTreatmentInformation: MedicalOrTreatmentInformation?
        public var profanityOrCrudeHumor: ProfanityOrCrudeHumor?
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var seventeenPlus: Bool? = nil
        public var sexualContentGraphicAndNudity: SexualContentGraphicAndNudity?
        public var sexualContentOrNudity: SexualContentOrNudity?
        public var unrestrictedWebAccess: Bool?
        public var violenceCartoonOrFantasy: ViolenceCartoonOrFantasy?
        public var violenceRealistic: ViolenceRealistic?
        public var violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic?

        @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
        public init(ageRatingOverride: AgeRatingOverride? = nil,
                    alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences? = nil,
                    contests: Contests? = nil,
                    gambling: Bool? = nil,
                    gamblingAndContests: Bool? = nil,
                    gamblingSimulated: GamblingSimulated? = nil,
                    horrorOrFearThemes: HorrorOrFearThemes? = nil,
                    kidsAgeBand: KidsAgeBand? = nil,
                    koreaAgeRatingOverride: KoreaAgeRatingOverride? = nil,
                    lootBox: Bool? = nil,
                    matureOrSuggestiveThemes: MatureOrSuggestiveThemes? = nil,
                    medicalOrTreatmentInformation: MedicalOrTreatmentInformation? = nil,
                    profanityOrCrudeHumor: ProfanityOrCrudeHumor? = nil,
                    seventeenPlus: Bool? = nil,
                    sexualContentGraphicAndNudity: SexualContentGraphicAndNudity? = nil,
                    sexualContentOrNudity: SexualContentOrNudity? = nil,
                    unrestrictedWebAccess: Bool? = nil,
                    violenceCartoonOrFantasy: ViolenceCartoonOrFantasy? = nil,
                    violenceRealistic: ViolenceRealistic? = nil,
                    violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic? = nil)
        {
            self.ageRatingOverride = ageRatingOverride
            self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
            self.contests = contests
            self.gambling = gambling
            self.gamblingAndContests = gamblingAndContests
            self.gamblingSimulated = gamblingSimulated
            self.horrorOrFearThemes = horrorOrFearThemes
            self.kidsAgeBand = kidsAgeBand
            self.koreaAgeRatingOverride = koreaAgeRatingOverride
            self.lootBox = lootBox
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

        public init(ageRatingOverride: AgeRatingOverride? = nil,
                    alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences? = nil,
                    contests: Contests? = nil,
                    gambling: Bool? = nil,
                    gamblingSimulated: GamblingSimulated? = nil,
                    horrorOrFearThemes: HorrorOrFearThemes? = nil,
                    kidsAgeBand: KidsAgeBand? = nil,
                    koreaAgeRatingOverride: KoreaAgeRatingOverride? = nil,
                    lootBox: Bool? = nil,
                    matureOrSuggestiveThemes: MatureOrSuggestiveThemes? = nil,
                    medicalOrTreatmentInformation: MedicalOrTreatmentInformation? = nil,
                    profanityOrCrudeHumor: ProfanityOrCrudeHumor? = nil,
                    sexualContentGraphicAndNudity: SexualContentGraphicAndNudity? = nil,
                    sexualContentOrNudity: SexualContentOrNudity? = nil,
                    unrestrictedWebAccess: Bool? = nil,
                    violenceCartoonOrFantasy: ViolenceCartoonOrFantasy? = nil,
                    violenceRealistic: ViolenceRealistic? = nil,
                    violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic? = nil)
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
            ageRatingOverride = try container.decodeIfPresent(AgeRatingOverride.self, forKey: "ageRatingOverride")
            alcoholTobaccoOrDrugUseOrReferences = try container.decodeIfPresent(AlcoholTobaccoOrDrugUseOrReferences.self, forKey: "alcoholTobaccoOrDrugUseOrReferences")
            contests = try container.decodeIfPresent(Contests.self, forKey: "contests")
            gambling = try container.decodeIfPresent(Bool.self, forKey: "gambling")
            gamblingAndContests = try container.decodeIfPresent(Bool.self, forKey: "gamblingAndContests")
            gamblingSimulated = try container.decodeIfPresent(GamblingSimulated.self, forKey: "gamblingSimulated")
            horrorOrFearThemes = try container.decodeIfPresent(HorrorOrFearThemes.self, forKey: "horrorOrFearThemes")
            kidsAgeBand = try container.decodeIfPresent(KidsAgeBand.self, forKey: "kidsAgeBand")
            koreaAgeRatingOverride = try container.decodeIfPresent(KoreaAgeRatingOverride.self, forKey: "koreaAgeRatingOverride")
            lootBox = try container.decodeIfPresent(Bool.self, forKey: "lootBox")
            matureOrSuggestiveThemes = try container.decodeIfPresent(MatureOrSuggestiveThemes.self, forKey: "matureOrSuggestiveThemes")
            medicalOrTreatmentInformation = try container.decodeIfPresent(MedicalOrTreatmentInformation.self, forKey: "medicalOrTreatmentInformation")
            profanityOrCrudeHumor = try container.decodeIfPresent(ProfanityOrCrudeHumor.self, forKey: "profanityOrCrudeHumor")
            seventeenPlus = try container.decodeIfPresent(Bool.self, forKey: "seventeenPlus")
            sexualContentGraphicAndNudity = try container.decodeIfPresent(SexualContentGraphicAndNudity.self, forKey: "sexualContentGraphicAndNudity")
            sexualContentOrNudity = try container.decodeIfPresent(SexualContentOrNudity.self, forKey: "sexualContentOrNudity")
            unrestrictedWebAccess = try container.decodeIfPresent(Bool.self, forKey: "unrestrictedWebAccess")
            violenceCartoonOrFantasy = try container.decodeIfPresent(ViolenceCartoonOrFantasy.self, forKey: "violenceCartoonOrFantasy")
            violenceRealistic = try container.decodeIfPresent(ViolenceRealistic.self, forKey: "violenceRealistic")
            violenceRealisticProlongedGraphicOrSadistic = try container.decodeIfPresent(ViolenceRealisticProlongedGraphicOrSadistic.self, forKey: "violenceRealisticProlongedGraphicOrSadistic")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(ageRatingOverride, forKey: "ageRatingOverride")
            try container.encodeIfPresent(alcoholTobaccoOrDrugUseOrReferences, forKey: "alcoholTobaccoOrDrugUseOrReferences")
            try container.encodeIfPresent(contests, forKey: "contests")
            try container.encodeIfPresent(gambling, forKey: "gambling")
            try container.encodeIfPresent(gamblingAndContests, forKey: "gamblingAndContests")
            try container.encodeIfPresent(gamblingSimulated, forKey: "gamblingSimulated")
            try container.encodeIfPresent(horrorOrFearThemes, forKey: "horrorOrFearThemes")
            try container.encodeIfPresent(kidsAgeBand, forKey: "kidsAgeBand")
            try container.encodeIfPresent(koreaAgeRatingOverride, forKey: "koreaAgeRatingOverride")
            try container.encodeIfPresent(lootBox, forKey: "lootBox")
            try container.encodeIfPresent(matureOrSuggestiveThemes, forKey: "matureOrSuggestiveThemes")
            try container.encodeIfPresent(medicalOrTreatmentInformation, forKey: "medicalOrTreatmentInformation")
            try container.encodeIfPresent(profanityOrCrudeHumor, forKey: "profanityOrCrudeHumor")
            try container.encodeIfPresent(seventeenPlus, forKey: "seventeenPlus")
            try container.encodeIfPresent(sexualContentGraphicAndNudity, forKey: "sexualContentGraphicAndNudity")
            try container.encodeIfPresent(sexualContentOrNudity, forKey: "sexualContentOrNudity")
            try container.encodeIfPresent(unrestrictedWebAccess, forKey: "unrestrictedWebAccess")
            try container.encodeIfPresent(violenceCartoonOrFantasy, forKey: "violenceCartoonOrFantasy")
            try container.encodeIfPresent(violenceRealistic, forKey: "violenceRealistic")
            try container.encodeIfPresent(violenceRealisticProlongedGraphicOrSadistic, forKey: "violenceRealisticProlongedGraphicOrSadistic")
        }

        public enum AgeRatingOverride: String, Sendable, Codable, CaseIterable {
            case none = "NONE"
            case seventeenPlus = "SEVENTEEN_PLUS"
            case unrated = "UNRATED"
        }

        public enum AlcoholTobaccoOrDrugUseOrReferences: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum Contests: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum GamblingSimulated: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum HorrorOrFearThemes: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum KoreaAgeRatingOverride: String, Sendable, Codable, CaseIterable {
            case fifteenPlus = "FIFTEEN_PLUS"
            case nineteenPlus = "NINETEEN_PLUS"
            case none = "NONE"
        }

        public enum MatureOrSuggestiveThemes: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum MedicalOrTreatmentInformation: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ProfanityOrCrudeHumor: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum SexualContentGraphicAndNudity: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum SexualContentOrNudity: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceCartoonOrFantasy: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceRealistic: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceRealisticProlongedGraphicOrSadistic: String, Sendable, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }
    }
}
