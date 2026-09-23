import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List Win-Back Offers

     The data structure that represents a get-v1-subscriptions-{id}-win back offers resource.

     ## Overview

     List all win-back offers for a specific subscription.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/subscriptions/6447497832/winBackOffers
     ```

     **Response:**

     ```json
     {
       "data": [
         {
           "type": "winBackOffers",
           "id": "10778326500",
           "attributes": {
             "referenceName": "6 Months for 3 A",
             "offerId": "6Monthfor3_a",
             "duration": "SIX_MONTHS",
             "offerMode": "PAY_UP_FRONT",
             "periodCount": 1,
             "customerEligibilityPaidSubscriptionDurationInMonths": 6,
             "customerEligibilityTimeSinceLastSubscribedInMonths": {
               "minimum": 2,
               "maximum": 24
             },
             "customerEligibilityWaitBetweenOffersInMonths": 2,
             "startDate": "2024-07-01",
             "endDate": "2024-07-31",
             "priority": "HIGH",
             "promotionIntent": "NOT_PROMOTED"
           },
           "relationships": {
             "promotion": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/relationships/promotion",
                 "related": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/promotion"
               }
             },
             "prices": {
               "links": {
                 "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/relationships/prices",
                 "related": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/prices"
               }
             }
           },
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/subscriptions/6447497832/winBackOffers?limit=1",
       },
       "meta": {
         "paging": {
           "total": 1,
           "limit": 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-winBackOffers>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listWinBackOffersForSubscriptionV1(id: String,
                                                   fields: [ListWinBackOffersForSubscriptionV1.Field]? = nil,
                                                   includes: [ListWinBackOffersForSubscriptionV1.Include]? = nil,
                                                   limits: [ListWinBackOffersForSubscriptionV1.Limit]? = nil) -> Request<WinBackOffersResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/winBackOffers",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListWinBackOffersForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type winBackOfferPrices
        case winBackOfferPrices([WinBackOfferPrices])
        /// The fields to include for returned resources of type winBackOffers
        case winBackOffers([WinBackOffers])

        public enum WinBackOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = WinBackOfferPrices(rawValue: string) {
                    self = value
                } else if let value = WinBackOfferPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid WinBackOfferPrices value: \(string)"
                    )
                }
            }
        }

        public enum WinBackOffers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerEligibilityPaidSubscriptionDurationInMonths
            case customerEligibilityTimeSinceLastSubscribedInMonths
            case customerEligibilityWaitBetweenOffersInMonths
            case duration
            case endDate
            case offerId
            case offerMode
            case periodCount
            case prices
            case priority
            case promotionIntent
            case referenceName
            case startDate
            case targetSubscriptionPlanType

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = WinBackOffers(rawValue: string) {
                    self = value
                } else if let value = WinBackOffers(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid WinBackOffers value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case prices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
