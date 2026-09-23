import BagbutikCore
import BagbutikMarketplacesModels

public extension Request {
    /**
     # Read variant information for an alternative distribution package

     Get detail information about specific alternative distribution package variants.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVariants/b4ab437b-5c13-42c7-b5ea-a8ec9889e402
     ```

     **Response:**

     ```json
     {
       "data": {
         "type": "alternativeDistributionPackageVariants",
         "id": "b4ab437b-5c13-42c7-b5ea-a8ec9889e402",
         "attributes": {
           "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/36/46/ba/3646ba66-ad35-b5a1-b5a9-9a9dc490a003/pre-thinned11331259484252926706.thinned.signed.dpkg.ipa?accessKey=1711774644_1998455851825254199_uT0vUvGvsLYpfkmz0nZAbYDgm%2FltUpIwELvs%2FAdDlr4XI%2BL2CYpH5NfuJAf7BQeodhtWeWGOkfHe%2BKfuPKD30YiHJWMgKveuplIcn%2BoWBEOVPvP0biY8rdV55YaV6jB3%2FqnqjKjjXiSlbJIZP9CPjOFYHF%2BetyJqCaJNObo1HwDgd6gVV6WUOno9U9ssXYxlUZR2bEnUA0DmnqCZKQJeHuF1XSrJPSUFdk5LmRrHbRINXd2olTY1kCQmEkplNa8d",
           "urlExpirationDate": "2024-03-29T21:57:24-07:00",
           "alternativeDistributionKeyBlob": "Z1HWrJd3AAAABAAAAAFUYH7ql3cAAAAEAAAAAfaWTj6EhQAAAAi4/6JJzTF4Y1vEfIGEhQAAAAgAAAAAZbrpdWGqs9GEhQAAAAgAAAACgAlM7EDAqpNQ2wAAABAUX/CANenwTqE+zCa0Go5RjmtHAlDbAAAA0O8d9OmuQVVLLHJ5NqHuy5RiIg1gFCSU596JSVqt30JomAeZmyeg7A033eOrl5UGaFPAFUtWBNYAG5Oy3LXEXurHcGP7R0bduTrcyRhUraRWwRZkFvlYSUpCqL4Ye6W+A1vBMODKDxXDk8ROjANbhCmnUTrE3wZ6N1RJqtbFiMAAL5V8ZHMgR/mppgj0/Qnv9R7Wkw7Fr00Mrn1xZcFZ4OtMG035PassXBun2/uV+Er5MItxy5QhBmmD9GDvKQfvJ/llljGGGQcUHVtH6hhr1QgxOKXMUNsAAAAQC7LlwBMbbKKOEA6MUONYa3Zf7XBQ2wAAABAMXIBQHUgb2uppLsFRWsjAJJC4HVDbAAAAEGkHfBWOZZ1ZzdI6an6H19Ro1KUAUNsAAABQkxQNnSw0CYr8aqmmO5mWa2erqyF96ZJP4vnno4RaWGYOBCJ+UtourTQRLEbLVMn9aAxqGNquuLQpYhxvsPS3VJkAwC5spOFlLS6RaYUnDTUHUZI1UNsAAAAg4ny+K6+r3sdb4bFZbmzsyAzIFORr5P0GcuNXEaYCHSMAAAAAUNsAAAAOAAAAAAAAAAAAAAAAAAA="
         },
         "links": {
           "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVariants/b4ab437b-5c13-42c7-b5ea-a8ec9889e402"
         }
       },
       "links": {
         "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVariants/b4ab437b-5c13-42c7-b5ea-a8ec9889e402"
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-alternativeDistributionPackageVariants-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAlternativeDistributionPackageVariantV1(id: String,
                                                           fields: [GetAlternativeDistributionPackageVariantV1.Field]? = nil) -> Request<AlternativeDistributionPackageVariantResponse, ErrorResponse> {
        .init(
            path: "/v1/alternativeDistributionPackageVariants/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetAlternativeDistributionPackageVariantV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type alternativeDistributionPackageVariants
        case alternativeDistributionPackageVariants([AlternativeDistributionPackageVariants])

        public enum AlternativeDistributionPackageVariants: String, Sendable, ParameterValue, Codable, CaseIterable {
            case alternativeDistributionKeyBlob
            case fileChecksum
            case url
            case urlExpirationDate

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = AlternativeDistributionPackageVariants(rawValue: string) {
                    self = value
                } else if let value = AlternativeDistributionPackageVariants(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid AlternativeDistributionPackageVariants value: \(string)"
                    )
                }
            }
        }
    }
}
