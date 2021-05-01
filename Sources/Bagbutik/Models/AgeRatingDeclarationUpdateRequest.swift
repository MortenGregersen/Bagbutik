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
            public let alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences?
            public let gamblingAndContests: Bool?
            public let gamblingSimulated: GamblingSimulated?
            public let horrorOrFearThemes: HorrorOrFearThemes?
            public let kidsAgeBand: KidsAgeBand?
            public let matureOrSuggestiveThemes: MatureOrSuggestiveThemes?
            public let medicalOrTreatmentInformation: MedicalOrTreatmentInformation?
            public let profanityOrCrudeHumor: ProfanityOrCrudeHumor?
            public let sexualContentGraphicAndNudity: SexualContentGraphicAndNudity?
            public let sexualContentOrNudity: SexualContentOrNudity?
            public let unrestrictedWebAccess: Bool?
            public let violenceCartoonOrFantasy: ViolenceCartoonOrFantasy?
            public let violenceRealistic: ViolenceRealistic?
            public let violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic?

            public init(alcoholTobaccoOrDrugUseOrReferences: AlcoholTobaccoOrDrugUseOrReferences? = nil, gamblingAndContests: Bool? = nil, gamblingSimulated: GamblingSimulated? = nil, horrorOrFearThemes: HorrorOrFearThemes? = nil, kidsAgeBand: KidsAgeBand? = nil, matureOrSuggestiveThemes: MatureOrSuggestiveThemes? = nil, medicalOrTreatmentInformation: MedicalOrTreatmentInformation? = nil, profanityOrCrudeHumor: ProfanityOrCrudeHumor? = nil, sexualContentGraphicAndNudity: SexualContentGraphicAndNudity? = nil, sexualContentOrNudity: SexualContentOrNudity? = nil, unrestrictedWebAccess: Bool? = nil, violenceCartoonOrFantasy: ViolenceCartoonOrFantasy? = nil, violenceRealistic: ViolenceRealistic? = nil, violenceRealisticProlongedGraphicOrSadistic: ViolenceRealisticProlongedGraphicOrSadistic? = nil) {
                self.alcoholTobaccoOrDrugUseOrReferences = alcoholTobaccoOrDrugUseOrReferences
                self.gamblingAndContests = gamblingAndContests
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

            public enum AlcoholTobaccoOrDrugUseOrReferences: String, Codable, CaseIterable {
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
