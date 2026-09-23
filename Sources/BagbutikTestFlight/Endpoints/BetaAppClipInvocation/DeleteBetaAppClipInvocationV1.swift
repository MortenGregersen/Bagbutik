import BagbutikCore
import BagbutikModelsShared
import BagbutikTestFlightModels

public extension Request {
    /**
     # Delete an app clip invocation for testers in testflight

     Delete an App Clip invocation you make available to testers in TestFlight.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-betaAppClipInvocations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBetaAppClipInvocationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/betaAppClipInvocations/\(id)",
            method: .delete)
    }
}
