public extension Request {
    /**
     # Delete a Default App Clip Experience Localization
     Delete localized metadata that appears on the App Clip card of a default App Clip experience.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_default_app_clip_experience_localization>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteAppClipDefaultExperienceLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/appClipDefaultExperienceLocalizations/\(id)", method: .delete)
    }
}
