import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # List Automatically Generated Prices for an App

     List the automatically calculated prices for an app generated from a base territory.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices
     ```

     **Response:**

     ```json
     {
       "data" : [ {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBRkciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBRkciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBR08iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBR08iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBSUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBSUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUk0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBUk0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVEciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVEciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVQiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBVVQiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJBWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRUwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRUwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCRkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCR1IiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCR1IiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSFMiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSUgiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCSUgiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFoiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTFoiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCTVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUkIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUk4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCUk4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCVE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCVE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCV0EiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJCV0EiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSEwiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSE4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSVYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDSVYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDTVIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDTVIiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0ciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0ciLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDT0wiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUFYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUFYiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDUkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWU0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWU0iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWVAiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWVAiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJDWkUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJERVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJERVUiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETUEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETksiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJETksiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJET00iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJET00iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJEWkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJEWkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFQ1UiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFQ1UiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFR1kiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFR1kiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1AiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1AiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJFU1QiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSU4iLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGSkkiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       }, {
         "type" : "appPrices",
         "id" : "eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9",
         "attributes" : {
           "manual" : false,
           "startDate" : "2023-02-28",
           "endDate" : null
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v2/appPrices/eyJzIjoiNjQ0NzQwMjE5MiIsInQiOiJGUkEiLCJwIjoiMTAwMDciLCJzZCI6MTY3NzU3MTIwMC4wMDAwMDAwMDAsImVkIjowLjB9"
         }
       } ],
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices",
         "next" : "https://api.appstoreconnect.apple.com/v1/appPriceSchedules/6447402192/automaticPrices?cursor=Mg.AKwzESA"
       },
       "meta" : {
         "paging" : {
           "total" : 172,
           "limit" : 50
         }
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appPriceSchedules-_id_-automaticPrices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAutomaticPricesForAppPriceScheduleV1(id: String,
                                                         fields: [ListAutomaticPricesForAppPriceScheduleV1.Field]? = nil,
                                                         filters: [ListAutomaticPricesForAppPriceScheduleV1.Filter]? = nil,
                                                         includes: [ListAutomaticPricesForAppPriceScheduleV1.Include]? = nil,
                                                         limit: Int? = nil) -> Request<AppPricesV2Response, ErrorResponse> {
        .init(
            path: "/v1/appPriceSchedules/\(id)/automaticPrices",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListAutomaticPricesForAppPriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPrices
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum AppPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case proceeds
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPricePoints(rawValue: string) {
                    self = value
                } else if let value = AppPricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPricePoints value: \(string)"
                    )
                }
            }
        }

        public enum AppPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appPricePoint
            case endDate
            case manual
            case startDate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppPrices(rawValue: string) {
                    self = value
                } else if let value = AppPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppPrices value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'endDate'
        case endDate([String])
        /// Filter by attribute 'startDate'
        case startDate([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appPricePoint
        case territory
    }
}
