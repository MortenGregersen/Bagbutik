import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read Win-Back Offer Information

     The data structure that represents a get-v1-win back offers-{id} resource.

     ## Overview

     Read details about a specific win-back offer.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500
     ```

     **Response:**

     ```json
     {
       "data": {
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
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-winBackOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related prices returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getWinBackOfferV1(id: String,
                                  fields: [GetWinBackOfferV1.Field]? = nil,
                                  includes: [GetWinBackOfferV1.Include]? = nil,
                                  limit: GetWinBackOfferV1.Limit? = nil) -> Request<WinBackOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetWinBackOfferV1 {
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
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
