import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List all promoted purchases for an app

     Get a list of promoted In-App Purchases, including promoted auto-renewable subscriptions, for an app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/apps/1000001234/promotedPurchases
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "promotedPurchases",
           "id": "bec0022d-99b1-69b6-7524-e051b51f1976",
           "attributes": {
             "visibleForAllUsers": true,
             "enabled": true,
             "state": "APPROVED"
           },
           "relationships": {
             "promotionImages": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976/relationships/promotionImages",
                 "related": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976/promotionImages"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/bec0022d-99b1-69b6-7524-e051b51f1976"
           }
         },
         {
           "type": "promotedPurchases",
           "id": "c5eb5306-0c66-eb2f-ee6a-7f4100536144",
           "attributes": {
             "visibleForAllUsers": true,
             "enabled": false,
             "state": "PREPARE_FOR_SUBMISSION"
           },
           "relationships": {
             "promotionImages": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144/relationships/promotionImages",
                 "related": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144/promotionImages"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/promotedPurchases/c5eb5306-0c66-eb2f-ee6a-7f4100536144"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/apps/1000001234/promotedPurchases"
       },
       "meta": {
         "paging": {
           "total": 2,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-promotedPurchases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPromotedPurchasesForAppV1(id: String,
                                              fields: [ListPromotedPurchasesForAppV1.Field]? = nil,
                                              includes: [ListPromotedPurchasesForAppV1.Include]? = nil,
                                              limit: Int? = nil) -> Request<PromotedPurchasesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/promotedPurchases",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListPromotedPurchasesForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
            case inAppPurchaseAvailability
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case offerCodes
            case pricePoints
            case productId
            case promotedPurchase
            case reviewNote
            case state
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchases(rawValue: string) {
                    self = value
                } else if let value = InAppPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchases value: \(string)"
                    )
                }
            }
        }

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PromotedPurchases(rawValue: string) {
                    self = value
                } else if let value = PromotedPurchases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PromotedPurchases value: \(string)"
                    )
                }
            }
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
            case introductoryOffers
            case marketSettings
            case multiSeatStatus
            case name
            case offerCodes
            case planAvailabilities
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
            case versions
            case winBackOffers

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Subscriptions(rawValue: string) {
                    self = value
                } else if let value = Subscriptions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Subscriptions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchaseV2
        case subscription
    }
}
