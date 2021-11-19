import Foundation

/**
 The data structure that represents a Build Actions resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction>
 */
public struct CiBuildAction: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "ciBuildActions" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe a Build Actions resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction/attributes>
     */
    public struct Attributes: Codable {
        /// The type of the build action.
        public let actionType: CiActionType?
        /// The status of the action.
        public let completionStatus: CiCompletionStatus?
        /// A string that indicates the progress of the build action.
        public let executionProgress: CiExecutionProgress?
        /// The date and time when Xcode Cloud finished performing the action.
        public let finishedDate: Date?
        /// A Boolean value that indicates whether the action must succeed in order for a build to succeed.
        public let isRequiredToPass: Bool?
        /// An integer value that represents the number of issues Xcode Cloud encountered when it performed the action.
        public let issueCounts: CiIssueCounts?
        /// The name of the build action; for example, Archive iOS.
        public let name: String?
        /// The date and time when Xcode Cloud started performing the action.
        public let startedDate: Date?

        public init(actionType: CiActionType? = nil, completionStatus: CiCompletionStatus? = nil, executionProgress: CiExecutionProgress? = nil, finishedDate: Date? = nil, isRequiredToPass: Bool? = nil, issueCounts: CiIssueCounts? = nil, name: String? = nil, startedDate: Date? = nil) {
            self.actionType = actionType
            self.completionStatus = completionStatus
            self.executionProgress = executionProgress
            self.finishedDate = finishedDate
            self.isRequiredToPass = isRequiredToPass
            self.issueCounts = issueCounts
            self.name = name
            self.startedDate = startedDate
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction/relationships>
     */
    public struct Relationships: Codable {
        public let buildRun: BuildRun?

        public init(buildRun: BuildRun? = nil) {
            self.buildRun = buildRun
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction/relationships/buildrun>
         */
        public struct BuildRun: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction/relationships/buildrun/data>
             */
            public struct Data: Codable {
                /// The opaque resource ID that uniquely identifies the resource.
                public let id: String
                /// The resource type.
                public var type: String { "ciBuildRuns" }

                public init(id: String) {
                    self.id = id
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/cibuildaction/relationships/buildrun/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
