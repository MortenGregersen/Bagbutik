import Bagbutik_Core
import Foundation

/**
 # AppInfoUpdateRequest
 The request body you use to update an App Info.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest>
 */
public struct AppInfoUpdateRequest: Codable, RequestBody {
    /// The resource data.
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

    /**
     # AppInfoUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
        /// An opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appInfos" }
        /// Navigational links to related data and included resource types and IDs.
        public var relationships: Relationships?

        public init(id: String,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        /**
         # AppInfoUpdateRequest.Data.Relationships
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public var primaryCategory: PrimaryCategory?
            public var primarySubcategoryOne: PrimarySubcategoryOne?
            public var primarySubcategoryTwo: PrimarySubcategoryTwo?
            public var secondaryCategory: SecondaryCategory?
            public var secondarySubcategoryOne: SecondarySubcategoryOne?
            public var secondarySubcategoryTwo: SecondarySubcategoryTwo?

            public init(primaryCategory: PrimaryCategory? = nil,
                        primarySubcategoryOne: PrimarySubcategoryOne? = nil,
                        primarySubcategoryTwo: PrimarySubcategoryTwo? = nil,
                        secondaryCategory: SecondaryCategory? = nil,
                        secondarySubcategoryOne: SecondarySubcategoryOne? = nil,
                        secondarySubcategoryTwo: SecondarySubcategoryTwo? = nil)
            {
                self.primaryCategory = primaryCategory
                self.primarySubcategoryOne = primarySubcategoryOne
                self.primarySubcategoryTwo = primarySubcategoryTwo
                self.secondaryCategory = secondaryCategory
                self.secondarySubcategoryOne = secondarySubcategoryOne
                self.secondarySubcategoryTwo = secondarySubcategoryTwo
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                primaryCategory = try container.decodeIfPresent(PrimaryCategory.self, forKey: "primaryCategory")
                primarySubcategoryOne = try container.decodeIfPresent(PrimarySubcategoryOne.self, forKey: "primarySubcategoryOne")
                primarySubcategoryTwo = try container.decodeIfPresent(PrimarySubcategoryTwo.self, forKey: "primarySubcategoryTwo")
                secondaryCategory = try container.decodeIfPresent(SecondaryCategory.self, forKey: "secondaryCategory")
                secondarySubcategoryOne = try container.decodeIfPresent(SecondarySubcategoryOne.self, forKey: "secondarySubcategoryOne")
                secondarySubcategoryTwo = try container.decodeIfPresent(SecondarySubcategoryTwo.self, forKey: "secondarySubcategoryTwo")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(primaryCategory, forKey: "primaryCategory")
                try container.encodeIfPresent(primarySubcategoryOne, forKey: "primarySubcategoryOne")
                try container.encodeIfPresent(primarySubcategoryTwo, forKey: "primarySubcategoryTwo")
                try container.encodeIfPresent(secondaryCategory, forKey: "secondaryCategory")
                try container.encodeIfPresent(secondarySubcategoryOne, forKey: "secondarySubcategoryOne")
                try container.encodeIfPresent(secondarySubcategoryTwo, forKey: "secondarySubcategoryTwo")
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.PrimaryCategory
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarycategory>
             */
            public struct PrimaryCategory: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.PrimaryCategory.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarycategory/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.PrimarySubcategoryOne
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategoryone>
             */
            public struct PrimarySubcategoryOne: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.PrimarySubcategoryOne.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategoryone/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.PrimarySubcategoryTwo
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategorytwo>
             */
            public struct PrimarySubcategoryTwo: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.PrimarySubcategoryTwo.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategorytwo/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.SecondaryCategory
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarycategory>
             */
            public struct SecondaryCategory: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.SecondaryCategory.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarycategory/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.SecondarySubcategoryOne
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategoryone>
             */
            public struct SecondarySubcategoryOne: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.SecondarySubcategoryOne.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategoryone/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppInfoUpdateRequest.Data.Relationships.SecondarySubcategoryTwo
             The data and links that describe the relationship between the resources.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategorytwo>
             */
            public struct SecondarySubcategoryTwo: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppInfoUpdateRequest.Data.Relationships.SecondarySubcategoryTwo.Data
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategorytwo/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// An opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
    }
}
