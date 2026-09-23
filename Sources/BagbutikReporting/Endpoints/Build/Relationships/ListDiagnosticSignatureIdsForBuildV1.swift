import BagbutikCore
import BagbutikAppStoreModels
import BagbutikReportingModels

public extension Request {
    /**
     # List diagnostic signature IDs for a build

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-builds-_id_-relationships-diagnosticSignatures>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listDiagnosticSignatureIdsForBuildV1(id: String,
                                                     limit: Int? = nil) -> Request<BuildDiagnosticSignaturesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/builds/\(id)/relationships/diagnosticSignatures",
            method: .get,
            parameters: .init(limit: limit))
    }
}
