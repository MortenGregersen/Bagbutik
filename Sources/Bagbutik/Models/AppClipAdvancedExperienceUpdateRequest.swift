import Foundation

/**
 The request body you use to update an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest>
 */
public struct AppClipAdvancedExperienceUpdateRequest: Codable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The relationship data to include in the response.
    public var included: [AppClipAdvancedExperienceLocalizationInlineCreate]?

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
        /// The opaque resource ID that uniquely identifies the request.
        public let id: String
        /// The resource type.
        public var type: String { "appClipAdvancedExperiences" }
        /// The attributes that describe the request that updates an Advanced App Clip Experiences resource.
        public var attributes: Attributes?
        /// The navigational links to related data and included resource types and IDs.
        public var relationships: Relationships?

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

        /**
         The attributes you set that describe the Advanced App Clip Experiences resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The call-to-action verb that appears on the App Clip card.
            public var action: AppClipAction?
            /// The business category of an advanced App Clip experience; for example, `PARKING`
            public var businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory?
            /// The default language for the advanced App Clip experience.
            public var defaultLanguage: AppClipAdvancedExperienceLanguage?
            /// A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.
            public var isPoweredBy: Bool?
            /// The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from location-based suggestions from Siri Suggestions and the Maps app.
            public var place: Place?
            /// A Boolean value that indicates whether you want to delete an advanced App Clip experience. To delete the advanced App Clip experience, set it to `true`.
            public var removed: Bool?

            public init(action: AppClipAction? = nil, businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory? = nil, defaultLanguage: AppClipAdvancedExperienceLanguage? = nil, isPoweredBy: Bool? = nil, place: Place? = nil, removed: Bool? = nil) {
                self.action = action
                self.businessCategory = businessCategory
                self.defaultLanguage = defaultLanguage
                self.isPoweredBy = isPoweredBy
                self.place = place
                self.removed = removed
            }

            /**
             The place information of an advanced App Clip experience you create with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place>
             */
            public struct Place: Codable {
                /// A list of categories for a place in Apple Maps you associate with the Advanced App Clip experience.
                public var categories: [String]?
                /// Coordinates of a place in Apple Maps you associate with an advanced App Clip experience.
                public var displayPoint: DisplayPoint?
                /// The optional website URL for a place.
                public var homePage: String?
                /// The main address of a place in Apple Maps. This value is required if you don’t provide coordinates for a place.
                public var mainAddress: MainAddress?
                /// A string that describes the intent behind an App Clip invocation from location-based suggestions from Siri Suggestions and the Maps app.
                public var mapAction: MapAction?
                /// An array of names as strings for a place in Apple Maps.
                public var names: [String]?
                /// The phone number that’s associated with a place in Apple Maps as a string.
                public var phoneNumber: PhoneNumber?
                /// An opaque ID that uniquely identifies a place. If you previously created a place in Apple Maps for the place you associate with your advanced App Clip experience, use its ID instead of creating a new ID.
                public var placeId: String?
                /// A navigational link to related data and included resource types and IDs.
                public var relationship: Relationship?

                public init(categories: [String]? = nil, displayPoint: DisplayPoint? = nil, homePage: String? = nil, mainAddress: MainAddress? = nil, mapAction: MapAction? = nil, names: [String]? = nil, phoneNumber: PhoneNumber? = nil, placeId: String? = nil, relationship: Relationship? = nil) {
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

                /**
                 A point-based representation of a place in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/displaypoint>
                 */
                public struct DisplayPoint: Codable {
                    /// The GPS coordinates of a place in Apple Maps you associate with the Advanced App Clip experience.
                    public var coordinates: Coordinates?
                    /// A string that describes the means by which you captured the data for a display point.
                    public var source: Source?

                    public init(coordinates: Coordinates? = nil, source: Source? = nil) {
                        self.coordinates = coordinates
                        self.source = source
                    }

                    /**
                     The coordinates for a point of interest or business in Apple Maps.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/displaypoint/coordinates>
                     */
                    public struct Coordinates: Codable {
                        /// A number that represents the latitude of GPS coordinates of a place in Apple Maps.
                        public var latitude: Double?
                        /// A number that represents the longitude of GPS coordinates of a place in Apple Maps.
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

                /**
                 The main address for a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/mainaddress>
                 */
                public struct MainAddress: Codable {
                    /// The address of a place in Apple Maps as a string.
                    public var fullAddress: String?
                    /// The structured address of a place in Apple Maps.
                    public var structuredAddress: StructuredAddress?

                    public init(fullAddress: String? = nil, structuredAddress: StructuredAddress? = nil) {
                        self.fullAddress = fullAddress
                        self.structuredAddress = structuredAddress
                    }

                    /**
                     The structured address information for a point of interest or business in Apple Maps.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/mainaddress/structuredaddress>
                     */
                    public struct StructuredAddress: Codable {
                        /// The country code of a place in Apple Maps you associate with the Advanced App Clip experience.
                        public var countryCode: String?
                        /// The identifier of a floor in a building.
                        public var floor: String?
                        /// The official locality component of a postal address; for example, a city or town.
                        public var locality: String?
                        /// The sub-locality component of a postal address; for example, a borough, county, or municipality.
                        public var neighborhood: String?
                        /// The mail sorting code associated with a postal address.
                        public var postalCode: String?
                        /// The province component of a postal address; for example, a state or territory.
                        public var stateProvince: String?
                        /// The officially recognized address used by a postal delivery address. It includes — when applicable — a street name, street suffix, building, house, or suite identifiers.
                        public var streetAddress: [String]?

                        public init(countryCode: String? = nil, floor: String? = nil, locality: String? = nil, neighborhood: String? = nil, postalCode: String? = nil, stateProvince: String? = nil, streetAddress: [String]? = nil) {
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

                /**
                 The phone number of a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/phonenumber>
                 */
                public struct PhoneNumber: Codable {
                    /// A string that describes the operational purpose of the phone number; for example `Customer Service` or `Help Desk`
                    public var intent: String?
                    /// The phone number as a string.
                    public var number: String?
                    /// The resource type.
                    public var type: PhoneNumberType?

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
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The related App Clips resource.
            public var appClip: AppClip?
            /// The related Advanced App Clip Experience Images resource.
            public var headerImage: HeaderImage?
            /// The related Advanced App Clip Experience Localizations resource.
            public var localizations: Localizations?

            public init(appClip: AppClip? = nil, headerImage: HeaderImage? = nil, localizations: Localizations? = nil) {
                self.appClip = appClip
                self.headerImage = headerImage
                self.localizations = localizations
            }

            /**
             The relationship to the App Clips resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/appclip>
             */
            public struct AppClip: Codable {
                /// The ID and type of the related App Clips resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the App Clips resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/appclip/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies an App Clips resource.
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

            /**
             The relationship to the App Clip Header Images resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/headerimage>
             */
            public struct HeaderImage: Codable {
                /// The ID and type of the related App Clip Header Images resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the App Clip Header Images resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/headerimage/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the related Advanced App Clip Experience Images resource.
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

            /**
             The relationship to the Advanced App Clip Experience Localizations resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/localizations>
             */
            public struct Localizations: Codable {
                /// The ID and type of the related Advanced App Clip Experience Localizations resource.
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                /**
                 The type and ID of the Advanced App Clip Experience Localizations resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/localizations/data>
                 */
                public struct Data: Codable {
                    /// The opaque resource ID that uniquely identifies the related Advanced App Clip Experience Localizations resource.
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
