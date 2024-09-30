import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceUpdateRequest
 The request body you use to update an advanced App Clip experience.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest>
 */
public struct AppClipAdvancedExperienceUpdateRequest: Codable, Sendable, RequestBody {
    /// The resource data.
    public let data: Data
    /// The relationship data to include in the response.
    public var included: [AppClipAdvancedExperienceLocalizationInlineCreate]?

    public init(data: Data,
                included: [AppClipAdvancedExperienceLocalizationInlineCreate]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([AppClipAdvancedExperienceLocalizationInlineCreate].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    /**
     # AppClipAdvancedExperienceUpdateRequest.Data
     The data element of the request body.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The opaque resource ID that uniquely identifies the request.
        public let id: String
        /// The resource type.
        public var type: String { "appClipAdvancedExperiences" }
        /// The attributes that describe the request that updates an Advanced App Clip Experiences resource.
        public var attributes: Attributes?
        /// The navigational links to related data and included resource types and IDs.
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        /**
         # AppClipAdvancedExperienceUpdateRequest.Data.Attributes
         The attributes you set that describe the Advanced App Clip Experiences resource.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
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

            public init(action: AppClipAction? = nil,
                        businessCategory: AppClipAdvancedExperience.Attributes.BusinessCategory? = nil,
                        defaultLanguage: AppClipAdvancedExperienceLanguage? = nil,
                        isPoweredBy: Bool? = nil,
                        place: Place? = nil,
                        removed: Bool? = nil)
            {
                self.action = action
                self.businessCategory = businessCategory
                self.defaultLanguage = defaultLanguage
                self.isPoweredBy = isPoweredBy
                self.place = place
                self.removed = removed
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                action = try container.decodeIfPresent(AppClipAction.self, forKey: "action")
                businessCategory = try container.decodeIfPresent(AppClipAdvancedExperience.Attributes.BusinessCategory.self, forKey: "businessCategory")
                defaultLanguage = try container.decodeIfPresent(AppClipAdvancedExperienceLanguage.self, forKey: "defaultLanguage")
                isPoweredBy = try container.decodeIfPresent(Bool.self, forKey: "isPoweredBy")
                place = try container.decodeIfPresent(Place.self, forKey: "place")
                removed = try container.decodeIfPresent(Bool.self, forKey: "removed")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(action, forKey: "action")
                try container.encodeIfPresent(businessCategory, forKey: "businessCategory")
                try container.encodeIfPresent(defaultLanguage, forKey: "defaultLanguage")
                try container.encodeIfPresent(isPoweredBy, forKey: "isPoweredBy")
                try container.encodeIfPresent(place, forKey: "place")
                try container.encodeIfPresent(removed, forKey: "removed")
            }

            /**
             # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place
             The place information of an advanced App Clip experience you create with this request.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place>
             */
            public struct Place: Codable, Sendable {
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

                public init(categories: [String]? = nil,
                            displayPoint: DisplayPoint? = nil,
                            homePage: String? = nil,
                            mainAddress: MainAddress? = nil,
                            mapAction: MapAction? = nil,
                            names: [String]? = nil,
                            phoneNumber: PhoneNumber? = nil,
                            placeId: String? = nil,
                            relationship: Relationship? = nil)
                {
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

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    categories = try container.decodeIfPresent([String].self, forKey: "categories")
                    displayPoint = try container.decodeIfPresent(DisplayPoint.self, forKey: "displayPoint")
                    homePage = try container.decodeIfPresent(String.self, forKey: "homePage")
                    mainAddress = try container.decodeIfPresent(MainAddress.self, forKey: "mainAddress")
                    mapAction = try container.decodeIfPresent(MapAction.self, forKey: "mapAction")
                    names = try container.decodeIfPresent([String].self, forKey: "names")
                    phoneNumber = try container.decodeIfPresent(PhoneNumber.self, forKey: "phoneNumber")
                    placeId = try container.decodeIfPresent(String.self, forKey: "placeId")
                    relationship = try container.decodeIfPresent(Relationship.self, forKey: "relationship")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(categories, forKey: "categories")
                    try container.encodeIfPresent(displayPoint, forKey: "displayPoint")
                    try container.encodeIfPresent(homePage, forKey: "homePage")
                    try container.encodeIfPresent(mainAddress, forKey: "mainAddress")
                    try container.encodeIfPresent(mapAction, forKey: "mapAction")
                    try container.encodeIfPresent(names, forKey: "names")
                    try container.encodeIfPresent(phoneNumber, forKey: "phoneNumber")
                    try container.encodeIfPresent(placeId, forKey: "placeId")
                    try container.encodeIfPresent(relationship, forKey: "relationship")
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place.DisplayPoint
                 A point-based representation of a place in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/displaypoint>
                 */
                public struct DisplayPoint: Codable, Sendable {
                    /// The GPS coordinates of a place in Apple Maps you associate with the Advanced App Clip experience.
                    public var coordinates: Coordinates?
                    /// A string that describes the means by which you captured the data for a display point.
                    public var source: Source?

                    public init(coordinates: Coordinates? = nil,
                                source: Source? = nil)
                    {
                        self.coordinates = coordinates
                        self.source = source
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        coordinates = try container.decodeIfPresent(Coordinates.self, forKey: "coordinates")
                        source = try container.decodeIfPresent(Source.self, forKey: "source")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(coordinates, forKey: "coordinates")
                        try container.encodeIfPresent(source, forKey: "source")
                    }

                    /**
                     # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place.DisplayPoint.Coordinates
                     The coordinates for a point of interest or business in Apple Maps.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/displaypoint/coordinates>
                     */
                    public struct Coordinates: Codable, Sendable {
                        /// A number that represents the latitude of GPS coordinates of a place in Apple Maps.
                        public var latitude: Double?
                        /// A number that represents the longitude of GPS coordinates of a place in Apple Maps.
                        public var longitude: Double?

                        public init(latitude: Double? = nil,
                                    longitude: Double? = nil)
                        {
                            self.latitude = latitude
                            self.longitude = longitude
                        }

                        public init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: AnyCodingKey.self)
                            latitude = try container.decodeIfPresent(Double.self, forKey: "latitude")
                            longitude = try container.decodeIfPresent(Double.self, forKey: "longitude")
                        }

                        public func encode(to encoder: Encoder) throws {
                            var container = encoder.container(keyedBy: AnyCodingKey.self)
                            try container.encodeIfPresent(latitude, forKey: "latitude")
                            try container.encodeIfPresent(longitude, forKey: "longitude")
                        }
                    }

                    public enum Source: String, Sendable, Codable, CaseIterable {
                        case calculated = "CALCULATED"
                        case manuallyPlaced = "MANUALLY_PLACED"
                    }
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place.MainAddress
                 The main address for a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/mainaddress>
                 */
                public struct MainAddress: Codable, Sendable {
                    /// The address of a place in Apple Maps as a string.
                    public var fullAddress: String?
                    /// The structured address of a place in Apple Maps.
                    public var structuredAddress: StructuredAddress?

                    public init(fullAddress: String? = nil,
                                structuredAddress: StructuredAddress? = nil)
                    {
                        self.fullAddress = fullAddress
                        self.structuredAddress = structuredAddress
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        fullAddress = try container.decodeIfPresent(String.self, forKey: "fullAddress")
                        structuredAddress = try container.decodeIfPresent(StructuredAddress.self, forKey: "structuredAddress")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(fullAddress, forKey: "fullAddress")
                        try container.encodeIfPresent(structuredAddress, forKey: "structuredAddress")
                    }

                    /**
                     # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place.MainAddress.StructuredAddress
                     The structured address information for a point of interest or business in Apple Maps.

                     Full documentation:
                     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/mainaddress/structuredaddress>
                     */
                    public struct StructuredAddress: Codable, Sendable {
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

                        public init(countryCode: String? = nil,
                                    floor: String? = nil,
                                    locality: String? = nil,
                                    neighborhood: String? = nil,
                                    postalCode: String? = nil,
                                    stateProvince: String? = nil,
                                    streetAddress: [String]? = nil)
                        {
                            self.countryCode = countryCode
                            self.floor = floor
                            self.locality = locality
                            self.neighborhood = neighborhood
                            self.postalCode = postalCode
                            self.stateProvince = stateProvince
                            self.streetAddress = streetAddress
                        }

                        public init(from decoder: Decoder) throws {
                            let container = try decoder.container(keyedBy: AnyCodingKey.self)
                            countryCode = try container.decodeIfPresent(String.self, forKey: "countryCode")
                            floor = try container.decodeIfPresent(String.self, forKey: "floor")
                            locality = try container.decodeIfPresent(String.self, forKey: "locality")
                            neighborhood = try container.decodeIfPresent(String.self, forKey: "neighborhood")
                            postalCode = try container.decodeIfPresent(String.self, forKey: "postalCode")
                            stateProvince = try container.decodeIfPresent(String.self, forKey: "stateProvince")
                            streetAddress = try container.decodeIfPresent([String].self, forKey: "streetAddress")
                        }

                        public func encode(to encoder: Encoder) throws {
                            var container = encoder.container(keyedBy: AnyCodingKey.self)
                            try container.encodeIfPresent(countryCode, forKey: "countryCode")
                            try container.encodeIfPresent(floor, forKey: "floor")
                            try container.encodeIfPresent(locality, forKey: "locality")
                            try container.encodeIfPresent(neighborhood, forKey: "neighborhood")
                            try container.encodeIfPresent(postalCode, forKey: "postalCode")
                            try container.encodeIfPresent(stateProvince, forKey: "stateProvince")
                            try container.encodeIfPresent(streetAddress, forKey: "streetAddress")
                        }
                    }
                }

                public enum MapAction: String, Sendable, Codable, CaseIterable {
                    case buyTickets = "BUY_TICKETS"
                    case hotelBookRoom = "HOTEL_BOOK_ROOM"
                    case parkingReserveParking = "PARKING_RESERVE_PARKING"
                    case restaurantJoinWaitlist = "RESTAURANT_JOIN_WAITLIST"
                    case restaurantOrderDelivery = "RESTAURANT_ORDER_DELIVERY"
                    case restaurantOrderFood = "RESTAURANT_ORDER_FOOD"
                    case restaurantOrderTakeout = "RESTAURANT_ORDER_TAKEOUT"
                    case restaurantReservation = "RESTAURANT_RESERVATION"
                    case restaurantViewMenu = "RESTAURANT_VIEW_MENU"
                    case scheduleAppointment = "SCHEDULE_APPOINTMENT"
                    case theaterNowPlaying = "THEATER_NOW_PLAYING"
                    case viewAvailability = "VIEW_AVAILABILITY"
                    case viewPricing = "VIEW_PRICING"
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Attributes.Place.PhoneNumber
                 The phone number of a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/attributes/place/phonenumber>
                 */
                public struct PhoneNumber: Codable, Sendable {
                    /// A string that describes the operational purpose of the phone number; for example `Customer Service` or `Help Desk`
                    public var intent: String?
                    /// The phone number as a string.
                    public var number: String?
                    /// The resource type.
                    public var type: PhoneNumberType?

                    public init(intent: String? = nil,
                                number: String? = nil,
                                type: PhoneNumberType? = nil)
                    {
                        self.intent = intent
                        self.number = number
                        self.type = type
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        intent = try container.decodeIfPresent(String.self, forKey: "intent")
                        number = try container.decodeIfPresent(String.self, forKey: "number")
                        type = try container.decode(PhoneNumberType.self, forKey: "type")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encodeIfPresent(intent, forKey: "intent")
                        try container.encodeIfPresent(number, forKey: "number")
                        try container.encode(type, forKey: "type")
                    }

                    public enum PhoneNumberType: String, Sendable, Codable, CaseIterable {
                        case fax = "FAX"
                        case landline = "LANDLINE"
                        case mobile = "MOBILE"
                        case tollfree = "TOLLFREE"
                    }
                }

                public enum Relationship: String, Sendable, Codable, CaseIterable {
                    case authorized = "AUTHORIZED"
                    case other = "OTHER"
                    case owner = "OWNER"
                }
            }
        }

        /**
         # AppClipAdvancedExperienceUpdateRequest.Data.Relationships
         The relationships to other resources that you can set with this request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships>
         */
        public struct Relationships: Codable, Sendable {
            /// The related App Clips resource.
            public var appClip: AppClip?
            /// The related Advanced App Clip Experience Images resource.
            public var headerImage: HeaderImage?
            /// The related Advanced App Clip Experience Localizations resource.
            public var localizations: Localizations?

            public init(appClip: AppClip? = nil,
                        headerImage: HeaderImage? = nil,
                        localizations: Localizations? = nil)
            {
                self.appClip = appClip
                self.headerImage = headerImage
                self.localizations = localizations
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                appClip = try container.decodeIfPresent(AppClip.self, forKey: "appClip")
                headerImage = try container.decodeIfPresent(HeaderImage.self, forKey: "headerImage")
                localizations = try container.decodeIfPresent(Localizations.self, forKey: "localizations")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(appClip, forKey: "appClip")
                try container.encodeIfPresent(headerImage, forKey: "headerImage")
                try container.encodeIfPresent(localizations, forKey: "localizations")
            }

            /**
             # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.AppClip
             The relationship to the App Clips resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/appclip>
             */
            public struct AppClip: Codable, Sendable {
                /// The ID and type of the related App Clips resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.AppClip.Data
                 The type and ID of the App Clips resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/appclip/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
                    /// The opaque resource ID that uniquely identifies an App Clips resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClips" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.HeaderImage
             The relationship to the App Clip Header Images resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/headerimage>
             */
            public struct HeaderImage: Codable, Sendable {
                /// The ID and type of the related App Clip Header Images resource.
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.HeaderImage.Data
                 The type and ID of the App Clip Header Images resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/headerimage/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Advanced App Clip Experience Images resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipAdvancedExperienceImages" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }

            /**
             # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.Localizations
             The relationship to the Advanced App Clip Experience Localizations resource you set with the request that updates an Advanced App Clip Experiences resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/localizations>
             */
            public struct Localizations: Codable, Sendable {
                /// The ID and type of the related Advanced App Clip Experience Localizations resource.
                @NullCodable public var data: [Data]?

                public init(data: [Data]? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decodeIfPresent([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # AppClipAdvancedExperienceUpdateRequest.Data.Relationships.Localizations.Data
                 The type and ID of the Advanced App Clip Experience Localizations resource that you’re relating with the Advanced App Clip Experiences resource you’re updating.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperienceupdaterequest/data/relationships/localizations/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
                    /// The opaque resource ID that uniquely identifies the related Advanced App Clip Experience Localizations resource.
                    public let id: String
                    /// The resource type.
                    public var type: String { "appClipAdvancedExperienceLocalizations" }

                    public init(id: String) {
                        self.id = id
                    }

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: AnyCodingKey.self)
                        id = try container.decode(String.self, forKey: "id")
                        if try container.decode(String.self, forKey: "type") != type {
                            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                        }
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: AnyCodingKey.self)
                        try container.encode(id, forKey: "id")
                        try container.encode(type, forKey: "type")
                    }
                }
            }
        }
    }
}
