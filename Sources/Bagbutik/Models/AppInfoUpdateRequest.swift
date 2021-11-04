import Foundation

/**
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

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appInfos" }
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, relationships: Relationships? = nil) {
            self.id = id
            self.relationships = relationships
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let primaryCategory: PrimaryCategory?
            public let primarySubcategoryOne: PrimarySubcategoryOne?
            public let primarySubcategoryTwo: PrimarySubcategoryTwo?
            public let secondaryCategory: SecondaryCategory?
            public let secondarySubcategoryOne: SecondarySubcategoryOne?
            public let secondarySubcategoryTwo: SecondarySubcategoryTwo?

            public init(primaryCategory: PrimaryCategory? = nil, primarySubcategoryOne: PrimarySubcategoryOne? = nil, primarySubcategoryTwo: PrimarySubcategoryTwo? = nil, secondaryCategory: SecondaryCategory? = nil, secondarySubcategoryOne: SecondarySubcategoryOne? = nil, secondarySubcategoryTwo: SecondarySubcategoryTwo? = nil) {
                self.primaryCategory = primaryCategory
                self.primarySubcategoryOne = primarySubcategoryOne
                self.primarySubcategoryTwo = primarySubcategoryTwo
                self.secondaryCategory = secondaryCategory
                self.secondarySubcategoryOne = secondarySubcategoryOne
                self.secondarySubcategoryTwo = secondarySubcategoryTwo
            }

            public struct PrimaryCategory: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarycategory/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct PrimarySubcategoryOne: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategoryone/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct PrimarySubcategoryTwo: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/primarysubcategorytwo/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct SecondaryCategory: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarycategory/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct SecondarySubcategoryOne: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategoryone/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }

            public struct SecondarySubcategoryTwo: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appinfoupdaterequest/data/relationships/secondarysubcategorytwo/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appCategories" }

                    public init(id: String) {
                        self.id = id
                    }
                }
            }
        }
    }
}
