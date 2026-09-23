import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the declaration document for an app encryption declaration

     Read the associated document for a specific App Encryption Declaration.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/6c2ddd3b-6d5e-4535-95f9-ece2c72c3848/appEncryptionDeclarationDocument
     ```

     **Response:**

     ```json
     {
       "data" : {
         "type" : "appEncryptionDeclarationDocuments",
         "id" : "e55c4bbe-a1b9-427c-99cf-fd8db5050fc9",
         "attributes" : {
           "fileSize" : 186110,
           "fileName" : "EncryptionDocumentation.pdf",
           "assetToken" : "Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf",
           "downloadUrl" : "https://misc-assets.itunes.apple.com/itunes-assets/Purple113/v4/11/d4/08/11d408a8-e57a-4541-60bb-4192a3722623/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9_EncryptionDocumentation.pdf?accessKey=1675044398_3481250329993679798_NHHQ2xtrY2EX3gS7CwgTVEwFSvYg1NO1KRtGg7LiuZQ9ASafREyyovMKVIm2AyCwWPHfd%2Fquw%2BrXJsN%2BAWBgKsOkNwTmjqrLA86eFDTPrajcum4yoziAitV%2BIiYH34nIreiGrF%2BMqePA%2FOijcxCGQH6Tle4YNoSb7q0B1SFcgFHUwCi9ML6hQIJ7AJyf2d4uJSouqy8zUWBwRDHBl2B0kpMj6BOSdY%2B22PiKpFQXweQ%3D",
           "sourceFileChecksum" : "d228e04d46284ca195ad1ac7d13e269b",
           "uploadOperations" : null,
           "assetDeliveryState" : {
             "errors" : [ ],
             "warnings" : null,
             "state" : "COMPLETE"
           }
         },
         "links" : {
           "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarationDocuments/e55c4bbe-a1b9-427c-99cf-fd8db5050fc9"
         }
       },
       "links" : {
         "self" : "https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/6c2ddd3b-6d5e-4535-95f9-ece2c72c3848/appEncryptionDeclarationDocument"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appEncryptionDeclarations-_id_-appEncryptionDeclarationDocument>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1(id: String,
                                                                                 fields: [GetAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1.Field]? = nil) -> Request<AppEncryptionDeclarationDocumentResponse, ErrorResponse> {
        .init(
            path: "/v1/appEncryptionDeclarations/\(id)/appEncryptionDeclarationDocument",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAppEncryptionDeclarationDocumentForAppEncryptionDeclarationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarationDocuments
        case appEncryptionDeclarationDocuments([AppEncryptionDeclarationDocuments])

        public enum AppEncryptionDeclarationDocuments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case downloadUrl
            case fileName
            case fileSize
            case sourceFileChecksum
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AppEncryptionDeclarationDocuments(rawValue: string) {
                    self = value
                } else if let value = AppEncryptionDeclarationDocuments(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AppEncryptionDeclarationDocuments value: \(string)"
                    )
                }
            }
        }
    }
}
