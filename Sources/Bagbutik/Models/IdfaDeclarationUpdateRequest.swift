import Foundation

/**
 The request body you use to update an IDFA Declaration.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest>
 */
public struct IdfaDeclarationUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "idfaDeclarations" }
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
         <https://developer.apple.com/documentation/appstoreconnectapi/idfadeclarationupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            @NullCodable public var attributesActionWithPreviousAd: Bool?
            @NullCodable public var attributesAppInstallationToPreviousAd: Bool?
            @NullCodable public var honorsLimitedAdTracking: Bool?
            @NullCodable public var servesAds: Bool?

            public init(attributesActionWithPreviousAd: Bool? = nil, attributesAppInstallationToPreviousAd: Bool? = nil, honorsLimitedAdTracking: Bool? = nil, servesAds: Bool? = nil) {
                self.attributesActionWithPreviousAd = attributesActionWithPreviousAd
                self.attributesAppInstallationToPreviousAd = attributesAppInstallationToPreviousAd
                self.honorsLimitedAdTracking = honorsLimitedAdTracking
                self.servesAds = servesAds
            }
        }
    }
}
