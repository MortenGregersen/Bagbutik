import Foundation

public struct AppClipAdvancedExperienceUpdateRequest: Codable, RequestBody {
    public let data: Data
    public let included: [AppClipAdvancedExperienceLocalizationInlineCreate]?

    public init(data: Data, included: [AppClipAdvancedExperienceLocalizationInlineCreate]? = nil) {
        self.data = data
        self.included = included
    }

    /**
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data>
     */
    public struct Data: Codable {
        /// The opaque resource ID that uniquely identifies the resource.
        public let id: String
        /// The resource type.
        public var type: String { "appClipAdvancedExperiences" }
        /// The resource's attributes.
        public let attributes: Attributes?
        /// The types and IDs of the related data to update.
        public let relationships: Relationships?

        public init(id: String, attributes: Attributes? = nil, relationships: Relationships? = nil) {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case id
            case type
            case attributes
            case relationships
        }

        public struct Attributes: Codable {
            public let action: AppClipAction?
            public let businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory?
            public let defaultLanguage: AppClipAdvancedExperienceLanguage?
            public let isPoweredBy: Bool?
            public let place: Place?
            public let removed: Bool?

            public init(action: AppClipAction? = nil, businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory? = nil, defaultLanguage: AppClipAdvancedExperienceLanguage? = nil, isPoweredBy: Bool? = nil, place: Place? = nil, removed: Bool? = nil) {
                self.action = action
                self.businessCategory = businessCategory
                self.defaultLanguage = defaultLanguage
                self.isPoweredBy = isPoweredBy
                self.place = place
                self.removed = removed
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

                    public init(intent: String? = nil, number: String? = nil) {
                        self.intent = intent
                        self.number = number
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: CodingKeys.self)
                        intent = try container.decodeIfPresent(String.self, forKey: .intent)
                        number = try container.decodeIfPresent(String.self, forKey: .number)
                        if try container.decode(String.self, forKey: .type) != type {
                            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: CodingKeys.self)
                        try container.encodeIfPresent(intent, forKey: .intent)
                        try container.encodeIfPresent(number, forKey: .number)
                        try container.encode(type, forKey: .type)
                    }

                    private enum CodingKeys: String, CodingKey {
                        case intent
                        case number
                        case type
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
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let appClip: AppClip?
            public let headerImage: HeaderImage?
            public let localizations: Localizations?

            public init(appClip: AppClip? = nil, headerImage: HeaderImage? = nil, localizations: Localizations? = nil) {
                self.appClip = appClip
                self.headerImage = headerImage
                self.localizations = localizations
            }

            public struct AppClip: Codable {
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/appclip/data>
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
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/headerimage/data>
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
                /// The type and ID of a resource that you're relating with the resource you're updating.
                public let data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of a resource that you're relating with the resource you're updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/localizations/data>
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
