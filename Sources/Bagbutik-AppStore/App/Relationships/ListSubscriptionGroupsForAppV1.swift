import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Subscription Groups for an App
     Get a list of subscription groups for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-subscriptionGroups>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubscriptionGroupsForAppV1(id: String,
                                               fields: [ListSubscriptionGroupsForAppV1.Field]? = nil,
                                               filters: [ListSubscriptionGroupsForAppV1.Filter]? = nil,
                                               includes: [ListSubscriptionGroupsForAppV1.Include]? = nil,
                                               sorts: [ListSubscriptionGroupsForAppV1.Sort]? = nil,
                                               limits: [ListSubscriptionGroupsForAppV1.Limit]? = nil) -> Request<SubscriptionGroupsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/subscriptionGroups", method: .get, parameters: .init(fields: fields,
                                                                                         filters: filters,
                                                                                         includes: includes,
                                                                                         sorts: sorts,
                                                                                         limits: limits))
    }
}

public enum ListSubscriptionGroupsForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGroupLocalizations
        case subscriptionGroupLocalizations([SubscriptionGroupLocalizations])
        /// The fields to include for returned resources of type subscriptionGroups
        case subscriptionGroups([SubscriptionGroups])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum SubscriptionGroupLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customAppName
            case locale
            case name
            case state
            case subscriptionGroup
        }

        public enum SubscriptionGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
            case introductoryOffers
            case name
            case offerCodes
            case pricePoints
            case prices
            case productId
            case promotedPurchase
            case promotionalOffers
            case reviewNote
            case state
            case subscriptionAvailability
            case subscriptionLocalizations
            case subscriptionPeriod
            case winBackOffers
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'referenceName'
        case referenceName([String])
        /// Filter by attribute 'subscriptions.state'
        case subscriptions_state([SubscriptionsState])

        public enum SubscriptionsState: String, Sendable, ParameterValue, Codable, CaseIterable {
            case approved = "APPROVED"
            case developerActionNeeded = "DEVELOPER_ACTION_NEEDED"
            case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
            case inReview = "IN_REVIEW"
            case missingMetadata = "MISSING_METADATA"
            case pendingBinaryApproval = "PENDING_BINARY_APPROVAL"
            case readyToSubmit = "READY_TO_SUBMIT"
            case rejected = "REJECTED"
            case removedFromSale = "REMOVED_FROM_SALE"
            case waitingForReview = "WAITING_FOR_REVIEW"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptionGroupLocalizations
        case subscriptions
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case referenceNameAscending = "referenceName"
        case referenceNameDescending = "-referenceName"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related subscriptionGroupLocalizations returned (when they are included) - maximum 50
        case subscriptionGroupLocalizations(Int)
        /// Maximum number of related subscriptions returned (when they are included) - maximum 50
        case subscriptions(Int)
    }
}
