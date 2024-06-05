import Bagbutik_Core
import Foundation

/**
 # AgeRatingDeclaration
 The data structure that represents an Age Rating Declarations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclaration>
 */
public struct AgeRatingDeclaration: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "ageRatingDeclarations" }
    /// Attributes that describe this Age Rating Declarations resource.
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

    /**
     # AgeRatingDeclaration.Attributes
     Attributes that describe an Age Rating Declarations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/ageratingdeclaration/attributes>
     */
    public struct Attributes: Codable {
        public var ageRatingOverride: AgeRatingOverride?
        /// Declaration for alcohol, tobacco, or drug use.
        public var alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences?
        /// Declaration for contests.
        public var contests: Contests?
        /// Declaration for gambling, provided as a Boolean value.
        public var gambling: Bool?
        /// Declaration for gambling or contests, as a Boolean value.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var gamblingAndContests: Bool? = nil
        /// Declaration for simulated gambling.
        public var gamblingSimulated: GamblingSimulated?
        /// Declaration for horror or fear themed content.
        public var horrorOrFearThemes: HorrorOrFearThemes?
        /// Declaration for the Kids Age Band value.
        public var kidsAgeBand: KidsAgeBand?
        /// Declaration for mature or suggestive themes.
        public var matureOrSuggestiveThemes: MatureOrSuggestiveThemes?
        /// Declaration for medical or treatment-focused content.
        public var medicalOrTreatmentInformation: MedicalOrTreatmentInformation?
        /// Declaration for profanity or crude humor.
        public var profanityOrCrudeHumor: ProfanityOrCrudeHumor?
        /// Declaration for a 17+ rating, provided as a Boolean value.
        @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
        public var seventeenPlus: Bool? = nil
        /// Declaration for graphic sexual content and nudity.
        public var sexualContentGraphicAndNudity: SexualContentGraphicAndNudity?
        /// Declaration for sexual content or nudity.
        public var sexualContentOrNudity: SexualContentOrNudity?
        /// Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.
        public var unrestrictedWebAccess: Bool?
        /// Declaration for cartoon or fantasy violence.
        public var violenceCartoonOrFantasy: ViolenceCartoonOrFantasy?
        /// Declaration for realistic violence.
        public var violenceRealistic: ViolenceRealistic?
        /// Declaration for prolonged realistic or sadistic violence.
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

        public enum AgeRatingOverride: String, Codable, CaseIterable {
            case none = "NONE"
            case seventeenPlus = "SEVENTEEN_PLUS"
            case unrated = "UNRATED"
        }

        public enum AlcoholTobaccoOrDrugUseOrReferences: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum Contests: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum GamblingSimulated: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum HorrorOrFearThemes: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum MatureOrSuggestiveThemes: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum MedicalOrTreatmentInformation: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ProfanityOrCrudeHumor: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum SexualContentGraphicAndNudity: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum SexualContentOrNudity: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceCartoonOrFantasy: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceRealistic: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }

        public enum ViolenceRealisticProlongedGraphicOrSadistic: String, Codable, CaseIterable {
            case frequentOrIntense = "FREQUENT_OR_INTENSE"
            case infrequentOrMild = "INFREQUENT_OR_MILD"
            case none = "NONE"
        }
    }
}
