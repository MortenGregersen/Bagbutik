import Foundation

/**
 The request body you use to update a Bundle ID Capability.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilityupdaterequest>
 */
public struct BundleIdCapabilityUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilityupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "bundleIdCapabilities" }
        /// The resource's attributes.
        public let attributes: Attributes?

        public init(id: String, attributes: Attributes? = nil) {
            self.id = id
            self.attributes = attributes
        }

        /**
         Attributes whose values you're changing as part of the update request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapabilityupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public let capabilityType: CapabilityType?
            public let settings: [CapabilitySetting]?

            public init(capabilityType: CapabilityType? = nil, settings: [CapabilitySetting]? = nil) {
                self.capabilityType = capabilityType
                self.settings = settings
            }
        }
    }
}
