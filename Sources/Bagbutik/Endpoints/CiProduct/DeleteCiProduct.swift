public extension Request {
    /**
      # Delete a Product
      Delete an Xcode Cloud product and all of its associated workflows, builds, and artifacts.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_product>

      - Parameter id: The id of the requested resource
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func deleteCiProduct(id: String) -> Request<EmptyResponse, ErrorResponse> {
        return .init(path: "/v1/ciProducts/\(id)", method: .delete)
    }
}
