@testable import BagbutikSpecDecoder
import XCTest

final class SpecTests: XCTestCase {
    func testFlattenIdenticalSchemas_InEndpoints() throws {
        let specString = """
        {
            "paths": {
                "/v1/profiles" : {
                    "get" : {
                        "tags" : [ "Profiles" ],
                        "operationId" : "profiles_getCollection",
                        "parameters" : [ {
                            "name" : "filter[profileType]",
                            "in" : "query",
                            "description" : "filter by attribute 'profileType'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false
                        }, {
                            "name" : "filter[preReleaseVersion.platform]",
                            "in" : "query",
                            "description" : "filter by attribute 'preReleaseVersion.platform'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false
                        } ],
                        "responses" : {
                            "400" : {
                                "description" : "Parameter error(s)",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "403" : {
                                "description" : "Forbidden error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "List of Profiles",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ProfilesResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "components": {
                "schemas": {
                    "Profile" : {
                        "type" : "object",
                        "title" : "Profile",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "profiles" ]
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "profileType" : {
                                        "type" : "string",
                                        "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                    }
                                }
                            }
                        }
                    },
                    "Platform" : {
                        "type" : "string",
                        "enum" : [ "IOS", "MAC_OS", "TV_OS" ]
                    },
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.flattenIdenticalSchemas()
        guard let operation = spec.paths["/v1/profiles"]?.operations[0],
              case .filter(_, let profileType, _, _) = operation.parameters?[0],
              case .simple(let profileTypeSimpleType) = profileType,
              case .filter(_, let platform, _, _) = operation.parameters?[1],
              case .simple(let platformSimpleType) = platform
        else {
            XCTFail(); return
        }
        XCTAssertEqual(profileTypeSimpleType.type, "Profile.Attributes.ProfileType")
        XCTAssertEqual(platformSimpleType.type, "Platform")
    }

    func testFlattenIdenticalSchemas_InModels() throws {
        let specString = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ProfileCreateRequest" : {
                        "type" : "object",
                        "title" : "ProfileCreateRequest",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "profiles" ]
                                    },
                                    "attributes" : {
                                        "type" : "object",
                                        "properties" : {
                                            "profileType" : {
                                                "type" : "string",
                                                "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                    "Profile" : {
                        "type" : "object",
                        "title" : "Profile",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "profiles" ]
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "profileType" : {
                                        "type" : "string",
                                        "enum" : [ "IOS_APP_DEVELOPMENT", "IOS_APP_STORE", "IOS_APP_ADHOC", "IOS_APP_INHOUSE", "MAC_APP_DEVELOPMENT", "MAC_APP_STORE", "MAC_APP_DIRECT", "TVOS_APP_DEVELOPMENT", "TVOS_APP_STORE", "TVOS_APP_ADHOC", "TVOS_APP_INHOUSE", "MAC_CATALYST_APP_DEVELOPMENT", "MAC_CATALYST_APP_STORE", "MAC_CATALYST_APP_DIRECT" ]
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        spec.flattenIdenticalSchemas()
        guard case .object(let profileCreateRequest) = spec.components.schemas["ProfileCreateRequest"],
              case .schema(let dataSchema) = profileCreateRequest.properties["data"]?.type,
              case .objectSchema(let dataAttributesSchema) = dataSchema.subSchemas.filter({ $0.name == "Attributes" }).first,
              case .schemaRef(let typeSchemaRef) = dataAttributesSchema.properties["profileType"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertEqual(typeSchemaRef, "Profile.Attributes.ProfileType")
    }

    func testApplyManualPatches() throws {
        let specString = """
        {
            "paths": {
                "/v1/ciBuildActions/{id}/relationships/buildRun" : {
                    "parameters" : [ {
                        "name" : "id",
                        "in" : "path",
                        "description" : "the id of the requested resource",
                        "schema" : {
                            "type" : "string"
                        },
                        "style" : "simple",
                        "required" : true
                    } ]
                },
                "/v1/subscriptions/{id}" : {
                    "get" : {
                        "tags" : [ "Subscriptions" ],
                        "operationId" : "subscriptions_getInstance",
                        "parameters" : [ {
                            "name" : "limit[winBackOffers]",
                            "in" : "query",
                            "description" : "maximum number of related winBackOffers returned (when they are included)",
                            "schema" : {
                                "type" : "integer",
                                "maximum" : 50
                            },
                            "style" : "form",
                            "required" : false
                        }, {
                            "name" : "fields[subscriptionOfferCodes]",
                            "in" : "query",
                            "description" : "the fields to include for returned resources of type subscriptionOfferCodes",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "name", "customerEligibilities", "offerEligibility", "duration", "offerMode", "numberOfPeriods", "active", "subscription", "oneTimeUseCodes", "customCodes", "prices" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false
                        } ],
                        "responses" : {
                            "404" : {
                                "description" : "Not found error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "Single Subscription",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/SubscriptionResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                "/v1/appInfos/{id}" : {
                    "get" : {
                        "tags" : [ "AppInfos" ],
                        "operationId" : "appInfos_getInstance",
                        "parameters" : [ {
                            "name" : "include",
                            "in" : "query",
                            "description" : "comma-separated list of relationships to include",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "app", "ageRatingDeclaration", "appInfoLocalizations", "primaryCategory", "primarySubcategoryOne", "primarySubcategoryTwo", "secondaryCategory", "secondarySubcategoryOne", "secondarySubcategoryTwo" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false
                        }, {
                            "name" : "fields[ageRatingDeclarations]",
                            "in" : "query",
                            "description" : "the fields to include for returned resources of type ageRatingDeclarations",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "alcoholTobaccoOrDrugUseOrReferences", "contests", "gambling", "gamblingSimulated", "kidsAgeBand", "lootBox", "medicalOrTreatmentInformation", "profanityOrCrudeHumor", "sexualContentGraphicAndNudity", "sexualContentOrNudity", "horrorOrFearThemes", "matureOrSuggestiveThemes", "unrestrictedWebAccess", "violenceCartoonOrFantasy", "violenceRealisticProlongedGraphicOrSadistic", "violenceRealistic", "koreaAgeRatingOverride" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false,
                            "required" : false,
                            "deprecated" : true
                        } ],
                        "responses" : {
                            "404" : {
                                "description" : "Not found error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "Single AppInfo",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/AppInfoResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                "/v1/apps/{id}/customerReviews" : {
                    "get" : {
                        "tags" : [ "Apps" ],
                        "operationId" : "apps_customerReviews_getToManyRelated",
                        "parameters" : [ {
                            "name" : "include",
                            "in" : "query",
                            "description" : "comma-separated list of relationships to include",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "response" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false
                        }, {
                            "name" : "filter[territory]",
                            "in" : "query",
                            "description" : "filter by attribute 'territory'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "ABW", "AFG", "AGO", "AIA", "ALB", "AND", "ANT", "ARE", "ARG", "ARM", "ASM", "ATG", "AUS", "AUT", "AZE", "BDI", "BEL", "BEN", "BES", "BFA", "BGD", "BGR", "BHR", "BHS", "BIH", "BLR", "BLZ", "BMU", "BOL", "BRA", "BRB", "BRN", "BTN", "BWA", "CAF", "CAN", "CHE", "CHL", "CHN", "CIV", "CMR", "COD", "COG", "COK", "COL", "COM", "CPV", "CRI", "CUB", "CUW", "CXR", "CYM", "CYP", "CZE", "DEU", "DJI", "DMA", "DNK", "DOM", "DZA", "ECU", "EGY", "ERI", "ESP", "EST", "ETH", "FIN", "FJI", "FLK", "FRA", "FRO", "FSM", "GAB", "GBR", "GEO", "GGY", "GHA", "GIB", "GIN", "GLP", "GMB", "GNB", "GNQ", "GRC", "GRD", "GRL", "GTM", "GUF", "GUM", "GUY", "HKG", "HND", "HRV", "HTI", "HUN", "IDN", "IMN", "IND", "IRL", "IRQ", "ISL", "ISR", "ITA", "JAM", "JEY", "JOR", "JPN", "KAZ", "KEN", "KGZ", "KHM", "KIR", "KNA", "KOR", "KWT", "LAO", "LBN", "LBR", "LBY", "LCA", "LIE", "LKA", "LSO", "LTU", "LUX", "LVA", "MAC", "MAR", "MCO", "MDA", "MDG", "MDV", "MEX", "MHL", "MKD", "MLI", "MLT", "MMR", "MNE", "MNG", "MNP", "MOZ", "MRT", "MSR", "MTQ", "MUS", "MWI", "MYS", "MYT", "NAM", "NCL", "NER", "NFK", "NGA", "NIC", "NIU", "NLD", "NOR", "NPL", "NRU", "NZL", "OMN", "PAK", "PAN", "PER", "PHL", "PLW", "PNG", "POL", "PRI", "PRT", "PRY", "PSE", "PYF", "QAT", "REU", "ROU", "RUS", "RWA", "SAU", "SEN", "SGP", "SHN", "SLB", "SLE", "SLV", "SMR", "SOM", "SPM", "SRB", "SSD", "STP", "SUR", "SVK", "SVN", "SWE", "SWZ", "SXM", "SYC", "TCA", "TCD", "TGO", "THA", "TJK", "TKM", "TLS", "TON", "TTO", "TUN", "TUR", "TUV", "TWN", "TZA", "UGA", "UKR", "UMI", "URY", "USA", "UZB", "VAT", "VCT", "VEN", "VGB", "VIR", "VNM", "VUT", "WLF", "WSM", "YEM", "ZAF", "ZMB", "ZWE" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false
                        } ],
                        "responses" : {
                            "404" : {
                                "description" : "Not found error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "Single AppInfo",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/AppInfoResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                "/v1/devices" : {
                    "get" : {
                        "tags" : [ "Devices" ],
                        "operationId" : "devices_getCollection",
                        "parameters" : [ {
                            "name" : "limit",
                            "in" : "query",
                            "description" : "maximum resources per page",
                            "schema" : {
                                "type" : "integer",
                                "maximum" : 200
                            },
                            "style" : "form"
                        }, {
                            "name" : "filter[platform]",
                            "in" : "query",
                            "description" : "filter by attribute 'platform'",
                            "schema" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "string",
                                    "enum" : [ "IOS", "MAC_OS", "UNIVERSAL" ]
                                }
                            },
                            "style" : "form",
                            "explode" : false
                        } ],
                        "responses" : {
                            "404" : {
                                "description" : "Not found error",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/ErrorResponse"
                                        }
                                    }
                                }
                            },
                            "200" : {
                                "description" : "Single AppInfo",
                                "content" : {
                                    "application/json" : {
                                        "schema" : {
                                            "$ref" : "#/components/schemas/AppInfoResponse"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            "components": {
                "schemas": {
                    "BuildBundle" : {
                        "type" : "object",
                        "title" : "BuildBundle",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "buildBundles" ]
                            },
                            "id" : {
                                "type" : "string"
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required" : [ "links", "id", "type" ]
                    },
                    "BundleIdPlatform" : {
                        "type" : "string",
                        "enum" : [ "IOS", "MAC_OS", "UNIVERSAL" ]
                    },
                    "Device" : {
                        "type" : "object",
                        "title" : "Device",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "devices" ]
                            },
                            "id" : {
                                "type" : "string"
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "status" : {
                                        "type" : "string",
                                        "enum" : [ "ENABLED", "DISABLED" ]
                                    },
                                    "deviceClass" : {
                                        "type" : "string",
                                        "enum" : [ "APPLE_WATCH", "IPAD", "IPHONE", "IPOD", "APPLE_TV", "MAC" ]
                                    },
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required" : [ "id", "type" ]
                    },
                    "ErrorResponse" : {
                        "type" : "object",
                        "properties" : {
                            "errors" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "object",
                                    "properties" : {
                                        "id" : {
                                            "type" : "string"
                                        },
                                        "status" : {
                                            "type" : "string"
                                        },
                                        "code" : {
                                            "type" : "string"
                                        },
                                        "title" : {
                                            "type" : "string"
                                        },
                                        "detail" : {
                                            "type" : "string"
                                        },
                                        "source" : {
                                            "oneOf" : [ {
                                                "$ref" : "#/components/schemas/ErrorSourcePointer"
                                            }, {
                                                "$ref" : "#/components/schemas/ErrorSourceParameter"
                                            } ]
                                        },
                                        "meta" : {
                                            "type" : "object",
                                            "additionalProperties" : { }
                                        }
                                    },
                                    "required" : [ "code", "detail", "status", "title" ]
                                }
                            }
                        }
                    },
                    "AgeRatingDeclarationUpdateRequest" : {
                        "type" : "object",
                        "title" : "AgeRatingDeclarationUpdateRequest",
                        "properties" : {
                            "data" : {
                                "type" : "object",
                                "properties" : {
                                    "type" : {
                                        "type" : "string",
                                        "enum" : [ "ageRatingDeclarations" ]
                                    },
                                    "id" : {
                                        "type" : "string"
                                    },
                                    "attributes" : {
                                        "type" : "object",
                                        "properties" : {
                                            "alcoholTobaccoOrDrugUseOrReferences" : {
                                                "type" : "string",
                                                "enum" : [ "NONE", "INFREQUENT_OR_MILD", "FREQUENT_OR_INTENSE" ]
                                            },
                                            "kidsAgeBand" : {
                                                "$ref" : "#/components/schemas/KidsAgeBand"
                                            }
                                        }
                                    }
                                },
                                "required" : [ "id", "type" ]
                            }
                        },
                        "required" : [ "data" ]
                    },
                    "TerritoryCode" : {
                        "type" : "string",
                        "enum" : [ "ABW", "AFG", "AGO", "AIA", "ALB" ]
                    },
                    "AppEvent" : {
                        "type" : "object",
                        "title" : "AppEvent",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "appEvents" ]
                            },
                            "id" : {
                                "type" : "string"
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "purchaseRequirement" : {
                                        "type" : "string"
                                    }
                                }
                            }
                        }
                    },
                    "AgeRatingDeclaration" : {
                        "type" : "object",
                        "title" : "AgeRatingDeclaration",
                        "properties" : {
                            "type" : {
                                "type" : "string",
                                "enum" : [ "ageRatingDeclarations" ]
                            },
                            "id" : {
                                "type" : "string"
                            },
                            "attributes" : {
                                "type" : "object",
                                "properties" : {
                                    "alcoholTobaccoOrDrugUseOrReferences" : {
                                        "type" : "string",
                                        "enum" : [ "NONE" ]
                                    },
                                    "contests" : {
                                        "type" : "string",
                                        "enum" : [ "NONE" ]
                                    }
                                }
                            },
                            "links" : {
                                "$ref" : "#/components/schemas/ResourceLinks"
                            }
                        },
                        "required" : [ "id", "type" ]
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        try spec.applyManualPatches()
        XCTAssertEqual(spec.paths.count, 4)

        guard case .enum(let bundleIdPlatformSchema) = spec.components.schemas["BundleIdPlatform"] else {
            XCTFail(); return
        }
        let bundleIdPlatformCaseValues = bundleIdPlatformSchema.cases.map(\.value)
        XCTAssertEqual(bundleIdPlatformCaseValues.count, 4)
        XCTAssertTrue(bundleIdPlatformCaseValues.contains("SERVICES"))

        guard case .object(let deviceSchema) = spec.components.schemas["Device"],
              let deviceAttributesSchema: ObjectSchema = deviceSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
                  guard case .objectSchema(let subSchema) = subSchema,
                        subSchema.name == "Attributes" else {
                      return nil
                  }
                  return subSchema
              }).first,
              let statusProperty = deviceAttributesSchema.properties["status"],
              case .enumSchema(let deviceStatusSchema) = statusProperty.type else {
            XCTFail(); return
        }
        let deviceStatusCaseValues = deviceStatusSchema.cases.map(\.value)
        XCTAssertEqual(deviceStatusCaseValues.count, 3)
        XCTAssertTrue(deviceStatusCaseValues.contains("PROCESSING"))

        guard case .object(let errorResponse) = spec.components.schemas["ErrorResponse"],
              case .arrayOfSubSchema(let errorSchema) = errorResponse.properties["errors"]?.type,
              case .oneOf(_, let oneOfSchema) = errorSchema.properties["source"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertFalse(errorSchema.requiredProperties.contains("detail"))
        XCTAssertEqual(oneOfSchema.options, [.schemaRef("JsonPointer"), .schemaRef("Parameter")])

        guard case .schema(let metaSchemaProperty) = errorSchema.properties["meta"]?.type,
              case .dictionary(let errorsArrayProperty) = metaSchemaProperty.properties["associatedErrors"]?.type,
              case .arrayOfSchemaRef(let errorSchemaRef) = errorsArrayProperty
        else {
            XCTFail(); return
        }
        XCTAssertEqual(errorSchemaRef, "Errors")

        guard case .object(let ageRatingDeclarationUpdateRequestSchema) = spec.components.schemas["AgeRatingDeclarationUpdateRequest"],
              let ageRatingDeclarationUpdateRequestDataSchema: ObjectSchema = ageRatingDeclarationUpdateRequestSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
                  guard case .objectSchema(let subSchema) = subSchema, subSchema.name == "Data" else { return nil }
                  return subSchema
              }).first,
              let ageRatingDeclarationUpdateRequestDataAttributesSchema: ObjectSchema = ageRatingDeclarationUpdateRequestDataSchema.subSchemas.compactMap({ (subSchema: SubSchema) -> ObjectSchema? in
                  guard case .objectSchema(let subSchema) = subSchema, subSchema.name == "Attributes" else { return nil }
                  return subSchema
              }).first,
              let kidsAgeBandProperty = ageRatingDeclarationUpdateRequestDataAttributesSchema.properties["kidsAgeBand"] else {
            XCTFail(); return
        }
        XCTAssertTrue(kidsAgeBandProperty.clearable)

        guard case .enum(let territoryCodeSchema) = spec.components.schemas["TerritoryCode"] else {
            XCTFail(); return
        }
        XCTAssertEqual(territoryCodeSchema.cases.count, 6)
        XCTAssertTrue(territoryCodeSchema.cases.contains { $0.id == "xks" && $0.value == "XKS" })

        guard case .object(let appEventSchema) = spec.components.schemas["AppEvent"],
              case .schema(let appEventAttributesSchema) = appEventSchema.properties["attributes"]?.type,
              let purchaseRequirementProperty = appEventAttributesSchema.properties["purchaseRequirement"],
              case .enumSchema(let purchaseRequirementEnumSchema) = purchaseRequirementProperty.type
        else {
            XCTFail(); return
        }
        XCTAssertTrue(purchaseRequirementEnumSchema.cases.count == 2)
        XCTAssertEqual(purchaseRequirementEnumSchema.cases.sorted(by: { $0.value < $1.value }),
                       [EnumCase(id: "inAppPurchase", value: "IN_APP_PURCHASE"),
                        EnumCase(id: "noCostAssociated", value: "NO_COST_ASSOCIATED")])

        guard case .object(let ageRatingDeclarationSchema) = spec.components.schemas["AgeRatingDeclaration"],
              case .schema(let ageRatingDeclarationAttributesSchema) = ageRatingDeclarationSchema.properties["attributes"]?.type,
              case .enumSchema(let alcoholTobaccoOrDrugUseOrReferencesSchema) = ageRatingDeclarationAttributesSchema.properties["alcoholTobaccoOrDrugUseOrReferences"]?.type,
              case .enumSchema(let contestsSchema) = ageRatingDeclarationAttributesSchema.properties["contests"]?.type,
              case .enumSchema(let ageRatingOverrideSchema) = ageRatingDeclarationAttributesSchema.properties["ageRatingOverride"]?.type
        else {
            XCTFail(); return
        }
        XCTAssertTrue(alcoholTobaccoOrDrugUseOrReferencesSchema.cases.count == 3)
        XCTAssertEqual(alcoholTobaccoOrDrugUseOrReferencesSchema.cases.sorted(by: { $0.value < $1.value }),
                       [
                           EnumCase(id: "frequentOrIntense", value: "FREQUENT_OR_INTENSE"),
                           EnumCase(id: "infrequentOrMild", value: "INFREQUENT_OR_MILD"),
                           EnumCase(id: "none", value: "NONE"),
                       ])
        XCTAssertTrue(contestsSchema.cases.count == 3)
        XCTAssertEqual(contestsSchema.cases.sorted(by: { $0.value < $1.value }),
                       [
                           EnumCase(id: "frequentOrIntense", value: "FREQUENT_OR_INTENSE"),
                           EnumCase(id: "infrequentOrMild", value: "INFREQUENT_OR_MILD"),
                           EnumCase(id: "none", value: "NONE"),
                       ])
        XCTAssertTrue(ageRatingOverrideSchema.cases.count == 3)
        XCTAssertEqual(ageRatingOverrideSchema.cases.sorted(by: { $0.value < $1.value }),
                       [
                           EnumCase(id: "none", value: "NONE"),
                           EnumCase(id: "seventeenPlus", value: "SEVENTEEN_PLUS"),
                           EnumCase(id: "unrated", value: "UNRATED"),
                       ])
    }

    func testApplyManualPatches_Error() throws {
        let specString = """
        {
            "paths": {},
            "components": {
                "schemas": {
                    "ErrorResponse" : {
                        "type" : "object",
                        "properties" : {
                            "errors" : {
                                "type" : "array",
                                "items" : {
                                    "type" : "object",
                                    "properties" : {
                                        "id" : {
                                            "type" : "string"
                                        },
                                        "status" : {
                                            "type" : "string"
                                        },
                                        "code" : {
                                            "type" : "string"
                                        },
                                        "title" : {
                                            "type" : "string"
                                        },
                                        "detail" : {
                                            "type" : "string"
                                        },
                                        "source" : {
                                            "oneOf" : [ {
                                                "$ref" : "#/components/schemas/ErrorSourcePointer"
                                            }, {
                                                "$ref" : "#/components/schemas/ErrorSourceBonanza"
                                            } ]
                                        }
                                    },
                                    "required" : [ "code", "detail", "title", "status" ]
                                }
                            }
                        }
                    }
                }
            }
        }
        """
        let jsonDecoder = JSONDecoder()
        var spec = try jsonDecoder.decode(Spec.self, from: specString.data(using: .utf8)!)
        XCTAssertThrowsError(try spec.applyManualPatches()) { error in
            XCTAssertEqual(error as! SpecError, .unexpectedErrorResponseSource(spec.components.schemas["ErrorResponse"]))
        }
    }
}
