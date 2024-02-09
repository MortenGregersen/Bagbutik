import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperience
 The data structure that represents an Advanced App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience>
 */
public struct AppClipAdvancedExperience: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Advanced App Clip Experiences resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipAdvancedExperiences" }
    /// The attributes that describe the Advanced App Clip Experiences resource.
    public var attributes: Attributes?
    /// The navigational links to related data and included resource types and IDs.
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # AppClipAdvancedExperience.Attributes
     The attributes that describe an Advanced App Clip Experiences resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes>
     */
    public struct Attributes: Codable {
        /// The call-to-action verb that appears on the App Clip card.
        public var action: AppClipAction?
        /// The business category of an advanced App Clip experience; for example, `PARKING`
        public var businessCategory: BusinessCategory?
        /// The default language for the advanced App Clip experience.
        public var defaultLanguage: AppClipAdvancedExperienceLanguage?
        /// A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.
        public var isPoweredBy: Bool?
        /// The invocation URL of the advanced App Clip experience.
        public var link: String?
        /// The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from location-based suggestions from Siri Suggestions and the Maps app.
        public var place: Place?
        /// A string that describes a place’s match status with Points of Interest (POI) in Apple Maps. `PENDING` indicates that Apple Maps is currently matching the place to a POI. `MATCHED` indicates that the provided place information matched a POI, and `NO_MATCH` indicates that the place doesn’t match a POI in Apple Maps or is in a location not supported by Apple Maps.
        public var placeStatus: PlaceStatus?
        /// A string that describes the status of an advanced App Clip experience. `RECEIVED` indicates that users can invoke this experience, `DEACTIVATED` indicates that the experience is deactivated and users can’t launch the App Clip with this invocation, and `APP_TRANSFER_IN_PROGRESS` indicates that the experience is part of an app that’s currently transferred to another developer.
        public var status: Status?
        /// The build version of the App Clip as an integer value; for example, `1234`.
        public var version: Int?

        public init(action: AppClipAction? = nil,
                    businessCategory: BusinessCategory? = nil,
                    defaultLanguage: AppClipAdvancedExperienceLanguage? = nil,
                    isPoweredBy: Bool? = nil,
                    link: String? = nil,
                    place: Place? = nil,
                    placeStatus: PlaceStatus? = nil,
                    status: Status? = nil,
                    version: Int? = nil)
        {
            self.action = action
            self.businessCategory = businessCategory
            self.defaultLanguage = defaultLanguage
            self.isPoweredBy = isPoweredBy
            self.link = link
            self.place = place
            self.placeStatus = placeStatus
            self.status = status
            self.version = version
        }

        public enum BusinessCategory: String, Codable, CaseIterable {
            case automotive = "AUTOMOTIVE"
            case beauty = "BEAUTY"
            case bikes = "BIKES"
            case books = "BOOKS"
            case casino = "CASINO"
            case education = "EDUCATION"
            case educationJapan = "EDUCATION_JAPAN"
            case entertainment = "ENTERTAINMENT"
            case evCharger = "EV_CHARGER"
            case financialCny = "FINANCIAL_CNY"
            case financialEur = "FINANCIAL_EUR"
            case financialGbp = "FINANCIAL_GBP"
            case financialJpy = "FINANCIAL_JPY"
            case financialUsd = "FINANCIAL_USD"
            case fitness = "FITNESS"
            case foodAndDrink = "FOOD_AND_DRINK"
            case gas = "GAS"
            case grocery = "GROCERY"
            case healthAndMedical = "HEALTH_AND_MEDICAL"
            case hotelAndTravel = "HOTEL_AND_TRAVEL"
            case music = "MUSIC"
            case parking = "PARKING"
            case petServices = "PET_SERVICES"
            case professionalServices = "PROFESSIONAL_SERVICES"
            case shopping = "SHOPPING"
            case ticketing = "TICKETING"
            case transit = "TRANSIT"
        }

        /**
         # AppClipAdvancedExperience.Attributes.Place
         The place information of an advanced App Clip experience.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place>
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

            /**
             # AppClipAdvancedExperience.Attributes.Place.DisplayPoint
             A point-based representation of a place in Apple Maps.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place/displaypoint>
             */
            public struct DisplayPoint: Codable {
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

                /**
                 # AppClipAdvancedExperience.Attributes.Place.DisplayPoint.Coordinates
                 The coordinates for a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place/displaypoint/coordinates>
                 */
                public struct Coordinates: Codable {
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
                }

                public enum Source: String, Codable, CaseIterable {
                    case calculated = "CALCULATED"
                    case manuallyPlaced = "MANUALLY_PLACED"
                }
            }

            /**
             # AppClipAdvancedExperience.Attributes.Place.MainAddress
             The main address for a point of interest or business in Apple Maps.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place/mainaddress>
             */
            public struct MainAddress: Codable {
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

                /**
                 # AppClipAdvancedExperience.Attributes.Place.MainAddress.StructuredAddress
                 The structured address information for a point of interest or business in Apple Maps.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place/mainaddress/structuredaddress>
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
                }
            }

            public enum MapAction: String, Codable, CaseIterable {
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
             # AppClipAdvancedExperience.Attributes.Place.PhoneNumber
             The phone number of a point of interest or business in Apple Maps.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes/place/phonenumber>
             */
            public struct PhoneNumber: Codable {
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

                public enum PhoneNumberType: String, Codable, CaseIterable {
                    case fax = "FAX"
                    case landline = "LANDLINE"
                    case mobile = "MOBILE"
                    case tollfree = "TOLLFREE"
                }
            }

            public enum Relationship: String, Codable, CaseIterable {
                case authorized = "AUTHORIZED"
                case other = "OTHER"
                case owner = "OWNER"
            }
        }

        public enum PlaceStatus: String, Codable, CaseIterable {
            case matched = "MATCHED"
            case noMatch = "NO_MATCH"
            case pending = "PENDING"
        }

        public enum Status: String, Codable, CaseIterable {
            case appTransferInProgress = "APP_TRANSFER_IN_PROGRESS"
            case deactivated = "DEACTIVATED"
            case received = "RECEIVED"
        }
    }

    /**
     # AppClipAdvancedExperience.Relationships
     The relationships of the Advanced App Clip Experiences resource you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships>
     */
    public struct Relationships: Codable {
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

        /**
         # AppClipAdvancedExperience.Relationships.AppClip
         The data and links that describe the relationship between the Advanced App Clip Experiences and the App Clips resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip>
         */
        public struct AppClip: Codable {
            /// The ID and type of the related App Clips resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # AppClipAdvancedExperience.Relationships.AppClip.Data
             The type and ID of a related App Clips resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip/data>
             */
            public struct Data: Codable, Identifiable {
                /// The opaque resource ID that uniquely identifies the related App Clips resource.
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

            /**
             # AppClipAdvancedExperience.Relationships.AppClip.Links
             The links to the related App Clips resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        /**
         # AppClipAdvancedExperience.Relationships.HeaderImage
         The data and links that describe the relationship between the Advanced App Clip Experiences and the App Clip Header Images resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage>
         */
        public struct HeaderImage: Codable {
            /// The ID and type of the related App Clip Header Images resource.
            @NullCodable public var data: Data?
            /// Navigational links that include the self-link.
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # AppClipAdvancedExperience.Relationships.HeaderImage.Data
             The type and ID of a related Header Images resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage/data>
             */
            public struct Data: Codable, Identifiable {
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

            /**
             # AppClipAdvancedExperience.Relationships.HeaderImage.Links
             The links to the related App Clip Header Images resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        /**
         # AppClipAdvancedExperience.Relationships.Localizations
         The data, links, and paging information that describe the relationship between the Advanced App Clip Experiences and the Localizations resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations>
         */
        public struct Localizations: Codable {
            /// The ID and type of the related Advanced App Clip Experience Localizations resource.
            @NullCodable public var data: [Data]?
            /// Navigational links that include the self-link.
            public var links: Links?
            /// The paging information.
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent([Data].self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: .meta)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
                try container.encodeIfPresent(meta, forKey: .meta)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
                case meta
            }

            /**
             # AppClipAdvancedExperience.Relationships.Localizations.Data
             The type and ID of a related Localizations resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations/data>
             */
            public struct Data: Codable, Identifiable {
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

            /**
             # AppClipAdvancedExperience.Relationships.Localizations.Links
             The links to the related Advanced App Clip Experience Localizations resource and the relationship’s self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations/links>
             */
            public struct Links: Codable {
                /// The link to related data.
                public var related: String?
                /// The link to the resource.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
