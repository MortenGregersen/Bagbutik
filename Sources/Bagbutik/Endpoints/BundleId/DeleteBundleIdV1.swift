public extension Request {
    /**
     # Delete a Bundle ID
     Delete a bundle ID that is used for app development.

     You can only delete bundle IDs that are used for development. You can’t delete bundle IDs that are being used by an app in App Store Connect.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_bundle_id>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteBundleIdV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/bundleIds/\(id)", method: .delete)
    }
}
