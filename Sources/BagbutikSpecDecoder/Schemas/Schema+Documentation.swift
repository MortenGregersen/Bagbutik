import Foundation

public extension Schema {
    struct Documentation: Equatable {
        public let summary: String
        public let properties: [String: String]?
        public let children: [String: Documentation]?

        public init(summary: String, properties: [String: String]? = nil, children: [String: Documentation]? = nil) {
            self.summary = summary
            self.properties = properties
            self.children = children
        }

        static let allDocumentation: [String: Documentation] = [
            "User": .init(summary: "The data structure that represents a Users resource.",
                          properties: [
                              "id": "The opaque resource ID that uniquely identifies the resource.",
                              "type": "The resource type.",
                              "links": "Navigational links that include the self-link.",
                          ],
                          children: [
                              "Attributes": .init(summary: "Attributes that describe a Users resource.",
                                                  properties: [
                                                      "firstName": "The user's first name.",
                                                      "lastName": "The user's last name.",
                                                      "roles": "Assigned user roles that determine the user's access to sections of App Store Connect and tasks they can perform.",
                                                      "provisioningAllowed": "A Boolean value that indicates the user's specified role allows access to the provisioning functionality on the Apple Developer website.",
                                                      "allAppsVisible": "A Boolean value that indicates whether a user has access to all apps available to the team.",
                                                      "username": "The user's Apple ID.",
                                                  ]),
                              "Relationships": .init(summary: "The relationships you included in the request and those on which you can operate.",
                                                     properties: [
                                                         "visibleApps": "The data and links that describe the relationship between the resources.",
                                                     ],
                                                     children: [
                                                         "VisibleApps": .init(summary: "The data and links that describe the relationship between the resources.",
                                                                              properties: ["data": "The type and ID of a related resource.",
                                                                                           "links": "The links to the related data and the relationship's self-link.",
                                                                                           "meta": "Paging information for data responses."]),
                                                     ]),
                          ]),
        ]
    }
}
