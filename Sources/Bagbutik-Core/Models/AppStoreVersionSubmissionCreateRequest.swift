import Foundation

/**
 # AppStoreVersionSubmissionCreateRequest
 The request body you use to create an App Store Version Submission.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissioncreaterequest>
 */
public struct AppStoreVersionSubmissionCreateRequest: Codable, RequestBody {
    /// The data element of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # AppStoreVersionSubmissionCreateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissioncreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appStoreVersionSubmissions" }
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(relationships: Relationships) {
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case relationships
            case type
        }

        /**
         # AppStoreVersionSubmissionCreateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissioncreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appStoreVersion: AppStoreVersion

            public init(appStoreVersion: AppStoreVersion) {
                self.appStoreVersion = appStoreVersion
            }

            /**
             # AppStoreVersionSubmissionCreateRequest.Data.Relationships.AppStoreVersion
             The relationships to other resources that you can set with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissioncreaterequest/data/relationships/appstoreversion>
             */
            public struct AppStoreVersion: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # AppStoreVersionSubmissionCreateRequest.Data.Relationships.AppStoreVersion.Data
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appstoreversionsubmissioncreaterequest/data/relationships/appstoreversion/data>
                 */
                public struct Data: Codable, Identifiable {
                    public let id: String
                    public var type: String { "appStoreVersions" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
