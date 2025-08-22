import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperience
 The data structure that represents an Advanced App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience>
 */
public struct AppClipAdvancedExperience: Codable, Sendable, Identifiable {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var action: AppClipAction?
        public var businessCategory: BusinessCategory?
        public var defaultLanguage: AppClipAdvancedExperienceLanguage?
        public var isPoweredBy: Bool?
        public var link: String?
        public var place: Place?
        public var placeStatus: PlaceStatus?
        public var status: Status?
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            action = try container.decodeIfPresent(AppClipAction.self, forKey: "action")
            businessCategory = try container.decodeIfPresent(BusinessCategory.self, forKey: "businessCategory")
            defaultLanguage = try container.decodeIfPresent(AppClipAdvancedExperienceLanguage.self, forKey: "defaultLanguage")
            isPoweredBy = try container.decodeIfPresent(Bool.self, forKey: "isPoweredBy")
            link = try container.decodeIfPresent(String.self, forKey: "link")
            place = try container.decodeIfPresent(Place.self, forKey: "place")
            placeStatus = try container.decodeIfPresent(PlaceStatus.self, forKey: "placeStatus")
            status = try container.decodeIfPresent(Status.self, forKey: "status")
            version = try container.decodeIfPresent(Int.self, forKey: "version")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(action, forKey: "action")
            try container.encodeIfPresent(businessCategory, forKey: "businessCategory")
            try container.encodeIfPresent(defaultLanguage, forKey: "defaultLanguage")
            try container.encodeIfPresent(isPoweredBy, forKey: "isPoweredBy")
            try container.encodeIfPresent(link, forKey: "link")
            try container.encodeIfPresent(place, forKey: "place")
            try container.encodeIfPresent(placeStatus, forKey: "placeStatus")
            try container.encodeIfPresent(status, forKey: "status")
            try container.encodeIfPresent(version, forKey: "version")
        }

        public enum BusinessCategory: String, Sendable, Codable, CaseIterable {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = BusinessCategory(rawValue: string) {
                    self = value
                } else if let value = BusinessCategory(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid BusinessCategory value: \(string)"
                    )
                }
            }
        }

        public struct Place: Codable, Sendable {
            public var categories: [String]?
            public var displayPoint: DisplayPoint?
            public var homePage: String?
            public var mainAddress: MainAddress?
            public var mapAction: MapAction?
            public var names: [String]?
            public var phoneNumber: PhoneNumber?
            public var placeId: String?
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

            public struct DisplayPoint: Codable, Sendable {
                public var coordinates: Coordinates?
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

                public struct Coordinates: Codable, Sendable {
                    public var latitude: Double?
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

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.singleValueContainer()
                        let string = try container.decode(String.self)
                        if let value = Source(rawValue: string) {
                            self = value
                        } else if let value = Source(rawValue: string.uppercased()) {
                            self = value
                        } else {
                            throw DecodingError.dataCorruptedError(
                                in: container,
                                debugDescription: "Invalid Source value: \(string)"
                            )
                        }
                    }
                }
            }

            public struct MainAddress: Codable, Sendable {
                public var fullAddress: String?
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

                public struct StructuredAddress: Codable, Sendable {
                    public var countryCode: String?
                    public var floor: String?
                    public var locality: String?
                    public var neighborhood: String?
                    public var postalCode: String?
                    public var stateProvince: String?
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
                case airlineBookTravel = "AIRLINE_BOOK_TRAVEL"
                case airlineCheckIn = "AIRLINE_CHECK_IN"
                case airlineFlightStatus = "AIRLINE_FLIGHT_STATUS"
                case apply = "APPLY"
                case book = "BOOK"
                case bookActivities = "BOOK_ACTIVITIES"
                case bookRides = "BOOK_RIDES"
                case bookTeetimes = "BOOK_TEETIMES"
                case bookTours = "BOOK_TOURS"
                case buyTickets = "BUY_TICKETS"
                case careers = "CAREERS"
                case chargeEv = "CHARGE_EV"
                case coupons = "COUPONS"
                case donate = "DONATE"
                case events = "EVENTS"
                case eventsShows = "EVENTS_SHOWS"
                case eventsSports = "EVENTS_SPORTS"
                case giftCard = "GIFT_CARD"
                case hotelAmenities = "HOTEL_AMENITIES"
                case hotelBookRoom = "HOTEL_BOOK_ROOM"
                case join = "JOIN"
                case parkingAvailable = "PARKING_AVAILABLE"
                case parkingReserveParking = "PARKING_RESERVE_PARKING"
                case restaurantJoinWaitlist = "RESTAURANT_JOIN_WAITLIST"
                case restaurantOrderDelivery = "RESTAURANT_ORDER_DELIVERY"
                case restaurantOrderFood = "RESTAURANT_ORDER_FOOD"
                case restaurantOrderTakeout = "RESTAURANT_ORDER_TAKEOUT"
                case restaurantPickup = "RESTAURANT_PICKUP"
                case restaurantReservation = "RESTAURANT_RESERVATION"
                case restaurantViewMenu = "RESTAURANT_VIEW_MENU"
                case retailServiceQuote = "RETAIL_SERVICE_QUOTE"
                case retailStoreDelivery = "RETAIL_STORE_DELIVERY"
                case retailStorePickup = "RETAIL_STORE_PICKUP"
                case retailStoreShop = "RETAIL_STORE_SHOP"
                case scheduleAppointment = "SCHEDULE_APPOINTMENT"
                case services = "SERVICES"
                case support = "SUPPORT"
                case theaterNowPlaying = "THEATER_NOW_PLAYING"
                case viewAvailability = "VIEW_AVAILABILITY"
                case viewPricing = "VIEW_PRICING"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = MapAction(rawValue: string) {
                        self = value
                    } else if let value = MapAction(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid MapAction value: \(string)"
                        )
                    }
                }
            }

            public struct PhoneNumber: Codable, Sendable {
                public var intent: String?
                public var number: String?
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

                    public init(from decoder: Decoder) throws {
                        let container = try decoder.singleValueContainer()
                        let string = try container.decode(String.self)
                        if let value = PhoneNumberType(rawValue: string) {
                            self = value
                        } else if let value = PhoneNumberType(rawValue: string.uppercased()) {
                            self = value
                        } else {
                            throw DecodingError.dataCorruptedError(
                                in: container,
                                debugDescription: "Invalid PhoneNumberType value: \(string)"
                            )
                        }
                    }
                }
            }

            public enum Relationship: String, Sendable, Codable, CaseIterable {
                case authorized = "AUTHORIZED"
                case other = "OTHER"
                case owner = "OWNER"

                public init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    let string = try container.decode(String.self)
                    if let value = Relationship(rawValue: string) {
                        self = value
                    } else if let value = Relationship(rawValue: string.uppercased()) {
                        self = value
                    } else {
                        throw DecodingError.dataCorruptedError(
                            in: container,
                            debugDescription: "Invalid Relationship value: \(string)"
                        )
                    }
                }
            }
        }

        public enum PlaceStatus: String, Sendable, Codable, CaseIterable {
            case matched = "MATCHED"
            case noMatch = "NO_MATCH"
            case pending = "PENDING"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = PlaceStatus(rawValue: string) {
                    self = value
                } else if let value = PlaceStatus(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid PlaceStatus value: \(string)"
                    )
                }
            }
        }

        public enum Status: String, Sendable, Codable, CaseIterable {
            case appTransferInProgress = "APP_TRANSFER_IN_PROGRESS"
            case deactivated = "DEACTIVATED"
            case received = "RECEIVED"

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Status(rawValue: string) {
                    self = value
                } else if let value = Status(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Status value: \(string)"
                    )
                }
            }
        }
    }

    public struct Relationships: Codable, Sendable {
        public var appClip: AppClip?
        public var headerImage: HeaderImage?
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

        public struct AppClip: Codable, Sendable {
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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

        public struct HeaderImage: Codable, Sendable {
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

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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

        public struct Localizations: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
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
