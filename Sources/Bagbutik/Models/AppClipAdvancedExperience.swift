import Foundation

/**
 The data structure that represents an Advanced App Clip Experiences resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience>
 */
public struct AppClipAdvancedExperience: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipAdvancedExperiences" }
    /// The resource's attributes.
    public let attributes: Attributes?
    /// Navigational links to related data and included resource types and IDs.
    public let relationships: Relationships?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil, relationships: Relationships? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
        case relationships
    }

    /**
     The attributes that describe an Advanced App Clip Experiences resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/attributes>
     */
    public struct Attributes: Codable {
        /// The call-to-action verb that appears on the App Clip card.
        public let action: AppClipAction?
        /// The business category of an advanced App Clip experience; for example, PARKING
        public let businessCategory: BusinessCategory?
        /// The default language for the advanced App Clip experience.
        public let defaultLanguage: AppClipAdvancedExperienceLanguage?
        /// A Boolean value that indicates whether the advanced App Clip experience was submitted by a platform provider that serves multiple businesses.
        public let isPoweredBy: Bool?
        /// The invocation URL of the advanced App Clip experience.
        public let link: String?
        /// The physical location you associate with the advanced App Clip experience. If you associate an advanced App Clip experience with a place, users can launch your App Clip from location-based suggestions from Siri Suggestions and the Maps app.
        public let place: Place?
        /// A string that describes a place’s match status with Points of Interest (POI) in Apple Maps. PENDING indicates that Apple Maps is currently matching the place to a POI. MATCHED indicates that the provided place information matched a POI, and NO_MATCH indicates that the place doesn’t match a POI in Apple Maps or is in a location not supported by Apple Maps.
        public let placeStatus: PlaceStatus?
        /// A string that describes the status of an advanced App Clip experience. RECEIVED indicates that users can invoke this experience, DEACTIVATED indicates that the experience is deactivated and users can’t launch the App Clip with this invocation, and APP_TRANSFER_IN_PROGRESS indicates that the experience is part of an app that’s currently transferred to another developer.
        public let status: Status?
        /// The build version of the App Clip as an integer value; for example, 1234.
        public let version: Int?

        public init(action: AppClipAction? = nil, businessCategory: BusinessCategory? = nil, defaultLanguage: AppClipAdvancedExperienceLanguage? = nil, isPoweredBy: Bool? = nil, link: String? = nil, place: Place? = nil, placeStatus: PlaceStatus? = nil, status: Status? = nil, version: Int? = nil) {
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
            case financialUsd = "FINANCIAL_USD"
            case financialCny = "FINANCIAL_CNY"
            case financialGbp = "FINANCIAL_GBP"
            case financialJpy = "FINANCIAL_JPY"
            case financialEur = "FINANCIAL_EUR"
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

        public enum PlaceStatus: String, Codable, CaseIterable {
            case pending = "PENDING"
            case matched = "MATCHED"
            case noMatch = "NO_MATCH"
        }

        public enum Status: String, Codable, CaseIterable {
            case received = "RECEIVED"
            case deactivated = "DEACTIVATED"
            case appTransferInProgress = "APP_TRANSFER_IN_PROGRESS"
        }
    }

    /**
     The relationships you included in the request and those on which you can operate.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships>
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

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip>
         */
        public struct AppClip: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip/data>
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/appclip/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage>
         */
        public struct HeaderImage: Codable {
            /// The type and ID of a related resource.
            public let data: Data?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?

            public init(data: Data? = nil, links: Links? = nil) {
                self.data = data
                self.links = links
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage/data>
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/headerimage/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }

        /**
         The data and links that describe the relationship between the resources.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations>
         */
        public struct Localizations: Codable {
            /// The type and ID of a related resource.
            public let data: [Data]?
            /// The links to the related data and the relationship's self-link.
            public let links: Links?
            /// Paging information for data responses.
            public let meta: PagingInformation?

            public init(data: [Data]? = nil, links: Links? = nil, meta: PagingInformation? = nil) {
                self.data = data
                self.links = links
                self.meta = meta
            }

            /**
             The type and ID of a related resource.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations/data>
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

            /**
             The links to the related data and the relationship's self-link.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperience/relationships/localizations/links>
             */
            public struct Links: Codable {
                /// The link to the related data.
                public let related: String?
                /// The relationship's self-link
                public let `self`: String?

                public init(related: String? = nil, self aSelf: String? = nil) {
                    self.related = related
                    self.`self` = aSelf
                }
            }
        }
    }
}
