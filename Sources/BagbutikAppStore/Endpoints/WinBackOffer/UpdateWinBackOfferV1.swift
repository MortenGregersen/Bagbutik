import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a Win-Back Offer

     The data structure that represents a patch-v1-win back offers-{id} resource.

     ## Overview

     Edit details for a specific win-back offer.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/winBackOffers/10759170294
     {
       "data": {
         "type": "winBackOffers",
         "id": "10778326500",
         "attributes": {
           "promotionIntent": "USE_AUTO_GENERATED_ASSETS",
           "startDate": "2024-07-04",
           "endDate": "2024-07-31"
         }
       }
     }
     ```

     **Response:**

     ```json
     "data": {
       "type": "winBackOffers",
       "id": "10778326500",
       "attributes": {
         "referenceName": "6 Months for 3 A",
         "offerId": "6Monthfor3_a",
         "duration": "SIX_MONTHS",
         "offerMode": "PAY_UP_FRONT",
         "periodCount": 1,
         "customerEligibilityPaidSubscriptionTenureInMonths": null,
         "customerEligibilityPaidSubscriptionDurationInMonths": 6,
         "customerEligibilityTimeSinceLastSubscribedInMonths": {
           "minimum": 2,
           "maximum": 24
         },
         "customerEligibilityWaitBetweenOffersInMonths": 2,
         "startDate": "2024-07-04",
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
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-winBackOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: WinBackOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateWinBackOfferV1(id: String,
                                     requestBody: WinBackOfferUpdateRequest) -> Request<WinBackOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/winBackOffers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
