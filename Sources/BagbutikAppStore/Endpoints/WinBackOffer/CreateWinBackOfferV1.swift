import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a Win-Back Offer

     Create a win-back offer for a specific subscription.

     ## Discussion

     > Important
     > Use a unique referenceName and offerId that you have not used for a promotional offer, offer code, or introductory offer, when you create your win-back offer.

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/winBackOffers
     {
       "data": {
         "type": "winBackOffers",
         "attributes": {
           "referenceName": "6 Months for 3 A",
           "offerId": "6Monthfor3_a",
           "startDate": "2024-07-01",
           "endDate": "2024-07-31",
           "priority": "HIGH",
           "promotionIntent": "USE_AUTO_GENERATED_ASSETS",
           "customerEligibilityPaidSubscriptionDurationInMonths": 6,
           "customerEligibilityTimeSinceLastSubscribedInMonths": {
             "minimum": 2,
             "maximum": 24
           },
           "customerEligibilityWaitBetweenOffersInMonths": 2,
           "duration": "SIX_MONTHS",
           "offerMode": "PAY_UP_FRONT",
           "periodCount": 1
         },
         "relationships": {
           "subscription": {
             "data": {
               "type": "subscriptions",
               "id": "6447497832"
             }
           },
           "prices": {
             "data": [
               {
                 "id": "${winbackOfferPrice-0}",
                 "type": "winBackOfferPrices"
               },
               {
                 "id": "${winbackOfferPrice-1}",
                 "type": "winBackOfferPrices"
               }
             ]
           }
         }
       },
       "included": [
         {
           "type": "winBackOfferPrices",
           "id": "${winbackOfferPrice-0}",
           "relationships": {
             "subscriptionPricePoint": {
               "data": {
                 "type": "subscriptionPricePoints",
                 "id": "eyJzIjoiNjQ0NzQ5NzgzMiIsInQiOiJVU0EiLCJwIjoiMTAxMjcifQ"
               }
             }
           }
         },
         {
           "type": "winBackOfferPrices",
           "id": "${winbackOfferPrice-1}",
           "relationships": {
             "subscriptionPricePoint": {
               "data": {
                 "type": "subscriptionPricePoints",
                 "id": "eyJzIjoiNjQ0NzQ5NzgzMiIsInQiOiJDQU4iLCJwIjoiMTAxNDIifQ"
               }
             }
           }
         }
       ]
     }
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
           "promotionIntent": "USE_AUTO_GENERATED_ASSETS"
         },
         "relationships": {
           "promotion": {
             "links": {
               "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/relationships/promotion",
               "related": "https://api.appstoreconnect.apple.com/v1/winBackOffers/10778326500/promotion"
             }
           },
           "prices": {
             "meta": {
               "paging": {
                 "total": 2,
                 "limit": 10
               }
             },
             "data": [
               {
                 "type": "winBackOfferPrices",
                 "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiQ0FOIiwicCI6IjEwMTQyIn0"
               },
               {
                 "type": "winBackOfferPrices",
                 "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiVVNBIiwicCI6IjEwMTI3In0"
               }
             ],
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
       "included": [
         {
           "type": "winBackOfferPrices",
           "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiQ0FOIiwicCI6IjEwMTQyIn0",
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/winBackOfferPrices/eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiQ0FOIiwicCI6IjEwMTQyIn0"
           }
         },
         {
           "type": "winBackOfferPrices",
           "id": "eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiVVNBIiwicCI6IjEwMTI3In0",
           "links": {
             "self": "https://api.appstoreconnect.apple.com/v1/winBackOfferPrices/eyJvIjoiMTA3NzgzMjY1MDAiLCJ0IjoiVVNBIiwicCI6IjEwMTI3In0"
           }
         }
       ],
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/winBackOffers"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-winBackOffers>

     - Parameter requestBody: WinBackOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createWinBackOfferV1(requestBody: WinBackOfferCreateRequest) -> Request<WinBackOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers",
            method: .post,
            requestBody: requestBody)
    }
}
