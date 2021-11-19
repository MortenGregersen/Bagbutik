import Foundation

/**
 The request body you use to create an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest>
 */
public struct AppClipAdvancedExperienceCreateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The included related resources.
    public let included: [AppClipAdvancedExperienceLocalizationInlineCreate]?

    public init(data: Data, included: [AppClipAdvancedExperienceLocalizationInlineCreate]? = nil) {
        self.data = data
        self.included = included
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data>
     */
    public struct Data: Codable {
        /// The resource type.
        public var type: String { "appClipAdvancedExperiences" }
        /// The resource's attributes.
        public let attributes: Attributes
        /// The relationships to other resources that you can set with this request.
        public let relationships: Relationships

        public init(attributes: Attributes, relationships: Relationships) {
            self.attributes = attributes
            self.relationships = relationships
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case type
            case attributes
            case relationships
        }

        /**
         Attributes that you set that describe the new resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The call-to-action verb that appears on the App Clip card.
            public let action: AppClipAction?
            /// The business category of an advanced App Clip experience; for example, PARKING
            public let businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory?
            /// The default language for the advanced App Clip experience.
            public let defaultLanguage: AppClipAdvancedExperienceLanguage
            /// A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.
            public let isPoweredBy: Bool
            /// The invocation URL of the advanced App Clip experience you’re creating.
            public let link: String
            /// The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from from location-based suggestions from Siri Suggestions and the Maps app.
            public let place: Place?

            public init(action: AppClipAction? = nil, businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory? = nil, defaultLanguage: AppClipAdvancedExperienceLanguage, isPoweredBy: Bool, link: String, place: Place? = nil) {
                self.action = action
                self.businessCategory = businessCategory
                self.defaultLanguage = defaultLanguage
                self.isPoweredBy = isPoweredBy
                self.link = link
                self.place = place
            }

            public struct Place: Codable {
                public let categories: String?
                public let displayPoint: DisplayPoint?
                public let homePage: String?
                public let mainAddress: MainAddress?
                public let mapAction: MapAction?
                public let names: String?
                public let phoneNumber: PhoneNumber?
                public let placeId: String?
                public let relationship: Relationship?

                public init(categories: String? = nil, displayPoint: DisplayPoint? = nil, homePage: String? = nil, mainAddress: MainAddress? = nil, mapAction: MapAction? = nil, names: String? = nil, phoneNumber: PhoneNumber? = nil, placeId: String? = nil, relationship: Relationship? = nil) {
                    self.categories = categories
                    self.displayPoint = displayPoint
                    self.homePage = homePage
                    self.mainAddress = mainAddress
                    self.mapAction = mapAction
                    self.names = names
                    self.phoneNumber = phoneNumber
                    self.placeId = placeId
                    self.relationship = relationship
                }

                public struct DisplayPoint: Codable {
                    public let coordinates: Coordinates?
                    public let source: Source?

                    public init(coordinates: Coordinates? = nil, source: Source? = nil) {
                        self.coordinates = coordinates
                        self.source = source
                    }

                    public struct Coordinates: Codable {
                        public let latitude: Double?
                        public let longitude: Double?

                        public init(latitude: Double? = nil, longitude: Double? = nil) {
                            self.latitude = latitude
                            self.longitude = longitude
                        }
                    }

                    public enum Source: String, Codable, CaseIterable {
                        case calculated = "CALCULATED"
                        case manuallyPlaced = "MANUALLY_PLACED"
                    }
                }

                public struct MainAddress: Codable {
                    public let fullAddress: String?
                    public let structuredAddress: StructuredAddress?

                    public init(fullAddress: String? = nil, structuredAddress: StructuredAddress? = nil) {
                        self.fullAddress = fullAddress
                        self.structuredAddress = structuredAddress
                    }

                    public struct StructuredAddress: Codable {
                        public let countryCode: String?
                        public let floor: String?
                        public let locality: String?
                        public let neighborhood: String?
                        public let postalCode: String?
                        public let stateProvince: String?
                        public let streetAddress: String?

                        public init(countryCode: String? = nil, floor: String? = nil, locality: String? = nil, neighborhood: String? = nil, postalCode: String? = nil, stateProvince: String? = nil, streetAddress: String? = nil) {
                            self.countryCode = countryCode
                            self.floor = floor
                            self.locality = locality
                            self.neighborhood = neighborhood
                            self.postalCode = postalCode
                            self.stateProvince = stateProvince
                            self.streetAddress = streetAddress
                        }
                    }
                }

                public enum MapAction: String, Codable, CaseIterable {
                    case buyTickets = "BUY_TICKETS"
                    case viewAvailability = "VIEW_AVAILABILITY"
                    case viewPricing = "VIEW_PRICING"
                    case hotelBookRoom = "HOTEL_BOOK_ROOM"
                    case parkingReserveParking = "PARKING_RESERVE_PARKING"
                    case restaurantJoinWaitlist = "RESTAURANT_JOIN_WAITLIST"
                    case restaurantOrderDelivery = "RESTAURANT_ORDER_DELIVERY"
                    case restaurantOrderFood = "RESTAURANT_ORDER_FOOD"
                    case restaurantOrderTakeout = "RESTAURANT_ORDER_TAKEOUT"
                    case restaurantReservation = "RESTAURANT_RESERVATION"
                    case scheduleAppointment = "SCHEDULE_APPOINTMENT"
                    case restaurantViewMenu = "RESTAURANT_VIEW_MENU"
                    case theaterNowPlaying = "THEATER_NOW_PLAYING"
                }

                public struct PhoneNumber: Codable {
                    public let intent: String?
                    public let number: String?
                    public let type: PhoneNumberType?

                    public init(intent: String? = nil, number: String? = nil, type: PhoneNumberType? = nil) {
                        self.intent = intent
                        self.number = number
                        self.type = type
                    }

                    public enum PhoneNumberType: String, Codable, CaseIterable {
                        case fax = "FAX"
                        case landline = "LANDLINE"
                        case mobile = "MOBILE"
                        case tollfree = "TOLLFREE"
                    }
                }

                public enum Relationship: String, Codable, CaseIterable {
                    case owner = "OWNER"
                    case authorized = "AUTHORIZED"
                    case other = "OTHER"
                }
            }
        }

        /**
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appClip: AppClip
            public let headerImage: HeaderImage
            public let localizations: Localizations

            public init(appClip: AppClip, headerImage: HeaderImage, localizations: Localizations) {
                self.appClip = appClip
                self.headerImage = headerImage
                self.localizations = localizations
            }

            public struct AppClip: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data/relationships/appclip/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClips" }

                    public init(id: String) {
                        self.id = id
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }

            public struct HeaderImage: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data/relationships/headerimage/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipAdvancedExperienceImages" }

                    public init(id: String) {
                        self.id = id
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }

            public struct Localizations: Codable {
                /// The type and ID of the resource that you're relating with the resource you're creating.
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                /**
                 The type and ID of the resource that you're relating with the resource you're creating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencecreaterequest/data/relationships/localizations/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipAdvancedExperienceLocalizations" }

                    public init(id: String) {
                        self.id = id
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encode(id, forKey: .id)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case id
                        case type
                    }
                }
            }
        }
    }
}
