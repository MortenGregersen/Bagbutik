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
    @NullCodable public var included: [AppClipAdvancedExperienceLocalizationInlineCreate]?

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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
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
            @NullCodable public var action: AppClipAction?
            /// The business category of an advanced App Clip experience; for example, PARKING
            @NullCodable public var businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory?
            /// The default language for the advanced App Clip experience.
            public let defaultLanguage: AppClipAdvancedExperienceLanguage
            /// A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.
            public let isPoweredBy: Bool
            /// The invocation URL of the advanced App Clip experience you’re creating.
            public let link: String
            /// The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from from location-based suggestions from Siri Suggestions and the Maps app.
            @NullCodable public var place: Place?

            public init(action: AppClipAction? = nil, businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory? = nil, defaultLanguage: AppClipAdvancedExperienceLanguage, isPoweredBy: Bool, link: String, place: Place? = nil) {
                self.action = action
                self.businessCategory = businessCategory
                self.defaultLanguage = defaultLanguage
                self.isPoweredBy = isPoweredBy
                self.link = link
                self.place = place
            }

            public struct Place: Codable {
                public var categories: String?
                @NullCodable public var displayPoint: DisplayPoint?
                public var homePage: String?
                @NullCodable public var mainAddress: MainAddress?
                @NullCodable public var mapAction: MapAction?
                public var names: String?
                @NullCodable public var phoneNumber: PhoneNumber?
                public var placeId: String?
                @NullCodable public var relationship: Relationship?

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
                    @NullCodable public var coordinates: Coordinates?
                    @NullCodable public var source: Source?

                    public init(coordinates: Coordinates? = nil, source: Source? = nil) {
                        self.coordinates = coordinates
                        self.source = source
                    }

                    public struct Coordinates: Codable {
                        public var latitude: Double?
                        public var longitude: Double?

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
                    public var fullAddress: String?
                    @NullCodable public var structuredAddress: StructuredAddress?

                    public init(fullAddress: String? = nil, structuredAddress: StructuredAddress? = nil) {
                        self.fullAddress = fullAddress
                        self.structuredAddress = structuredAddress
                    }

                    public struct StructuredAddress: Codable {
                        public var countryCode: String?
                        public var floor: String?
                        public var locality: String?
                        public var neighborhood: String?
                        public var postalCode: String?
                        public var stateProvince: String?
                        public var streetAddress: String?

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
                    public var intent: String?
                    public var number: String?
                    @NullCodable public var type: PhoneNumberType?

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

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
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

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
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

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        id = try container.decode(String.self, forKey: .id)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
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
