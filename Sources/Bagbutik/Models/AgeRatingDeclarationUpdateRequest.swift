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
            public let alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences?
            /// Declaration for contests.
            public let contests: Contests?
            /// Declaration for gambling, provided as a Boolean value.
            public let gambling: Bool?
            /// Declaration for gambling or contests, as a Boolean value.
            @available(*, deprecated, message: "Apple has marked this property deprecated and it will be removed sometime in the future.")
            public var gamblingAndContests: Bool? = nil
            /// Declaration for simulated gambling.
            public let gamblingSimulated: GamblingSimulated?
            /// Declaration for horror or fear themed content.
            public let horrorOrFearThemes: HorrorOrFearThemes?
            /// Declaration for the Kids Age Band value.
            public let kidsAgeBand: KidsAgeBand?
            /// Declaration for mature or suggestive themes.
            public let matureOrSuggestiveThemes: MatureOrSuggestiveThemes?
            /// Declaration for medical or treatment-focused content.
            public let medicalOrTreatmentInformation: MedicalOrTreatmentInformation?
            /// Declaration for profanity or crude humor.
            public let profanityOrCrudeHumor: ProfanityOrCrudeHumor?
            /// Declaration for a 17+ rating, provided as a Boolean value.
            public let seventeenPlus: Bool?
            /// Declaration for graphic sexual content and nudity.
            public let sexualContentGraphicAndNudity: SexualContentGraphicAndNudity?
            /// Declaration for sexual content or nudity.
            public let sexualContentOrNudity: SexualContentOrNudity?
            /// Declaration for unrestricted web access, such as with an embedded browser, provided as a Boolean value.
            public let unrestrictedWebAccess: Bool?
            /// Declaration for cartoon or fantasy violence.
            public let violenceCartoonOrFantasy: ViolenceCartoonOrFantasy?
            /// Declaration for realistic violence.
            public let violenceRealistic: ViolenceRealistic?
            /// Declaration for prolonged realistic or sadistic violence.
            public let violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic?

            @available(*, deprecated, message: "This uses a property Apple has marked as deprecated.")
            public init(alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences? = nil, contests: Contests? = nil, gambling: Bool? = nil, gamblingAndContests: Bool? = nil, gamblingSimulated: GamblingSimulated? = nil, horrorOrFearThemes: HorrorOrFearThemes? = nil, kidsAgeBand: KidsAgeBand? = nil, matureOrSuggestiveThemes: MatureOrSuggestiveThemes? = nil, medicalOrTreatmentInformation: MedicalOrTreatmentInformation? = nil, profanityOrCrudeHumor: ProfanityOrCrudeHumor? = nil, seventeenPlus: Bool? = nil, sexualContentGraphicAndNudity: SexualContentGraphicAndNudity? = nil, sexualContentOrNudity: SexualContentOrNudity? = nil, unrestrictedWebAccess: Bool? = nil, violenceCartoonOrFantasy: ViolenceCartoonOrFantasy? = nil, violenceRealistic: ViolenceRealistic? = nil, violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic? = nil) {
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

            public init(alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences? = nil, contests: Contests? = nil, gambling: Bool? = nil, gamblingSimulated: GamblingSimulated? = nil, horrorOrFearThemes: HorrorOrFearThemes? = nil, kidsAgeBand: KidsAgeBand? = nil, matureOrSuggestiveThemes: MatureOrSuggestiveThemes? = nil, medicalOrTreatmentInformation: MedicalOrTreatmentInformation? = nil, profanityOrCrudeHumor: ProfanityOrCrudeHumor? = nil, seventeenPlus: Bool? = nil, sexualContentGraphicAndNudity: SexualContentGraphicAndNudity? = nil, sexualContentOrNudity: SexualContentOrNudity? = nil, unrestrictedWebAccess: Bool? = nil, violenceCartoonOrFantasy: ViolenceCartoonOrFantasy? = nil, violenceRealistic: ViolenceRealistic? = nil, violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic? = nil) {
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

            public enum AlcoholTobaccoOrDrugUseOrReferences: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum Contests: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum GamblingSimulated: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum HorrorOrFearThemes: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum MatureOrSuggestiveThemes: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum MedicalOrTreatmentInformation: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum ProfanityOrCrudeHumor: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum SexualContentGraphicAndNudity: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum SexualContentOrNudity: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum ViolenceCartoonOrFantasy: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum ViolenceRealistic: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }

            public enum ViolenceRealisticProlongedGraphicOrSadistic: String, Codable, CaseIterable {
                case none = "NONE"
                case infrequentOrMild = "INFREQUENT_OR_MILD"
                case frequentOrIntense = "FREQUENT_OR_INTENSE"
            }
        }
    }
}
