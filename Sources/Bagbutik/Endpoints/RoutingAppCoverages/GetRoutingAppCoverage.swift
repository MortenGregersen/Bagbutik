public extension Request {
    enum GetRoutingAppCoverage {
        /**
         Fields to return for included related types.
         */
        public enum Field: FieldParameter {
            /// The fields to include for returned resources of type routingAppCoverages
            case routingAppCoverages([RoutingAppCoverages])

            public enum RoutingAppCoverages: String, ParameterValue, CaseIterable {
                case appStoreVersion
                case assetDeliveryState
                case fileName
                case fileSize
                case sourceFileChecksum
                case uploadOperations
                case uploaded
            }
        }

        /**
         Relationship data to include in the response.
         */
        public enum Include: String, IncludeParameter {
            case appStoreVersion
        }
    }

    /**
      # Read Routing App Coverage Information
      Get information about the routing app coverage file and its upload and processing status.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_routing_app_coverage_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getRoutingAppCoverage(id: String,
                                      fields: [GetRoutingAppCoverage.Field]? = nil,
                                      includes: [GetRoutingAppCoverage.Include]? = nil) -> Request<RoutingAppCoverageResponse, ErrorResponse>
    {
        return .init(path: "/v1/routingAppCoverages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                            includes: includes))
    }
}
