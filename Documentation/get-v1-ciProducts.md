<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciProducts",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciProducts"
  },
  "title" : "List all xcode cloud products"
}
-->

# List all xcode cloud products

Get a list of all products you created in Xcode Cloud.

## Discussion

The example request below lists ten Xcode Cloud products and sorts the list using the `latestBuildCreatedDate` attribute. Use the information provided in the response to display data about your Xcode Cloud products on a dashboard or to read additional information; for example, workflow information.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciProducts?limit=10&sort=latestBuildCreatedDate
```

**Response:**

```json
{
    "data": [
        {
            "type": "ciProducts",
            "id": "cfdc7a3b-0fdf-4463-a0e7-cf9067557beb",
            "attributes": {
                "name": "My Product 5",
                "createdDate": "2021-08-17T18:11:04.616669Z",
                "productType": "APP"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/app"
                    }
                },
                "workflows": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/workflows",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/workflows"
                    }
                },
                "buildRuns": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/relationships/buildRuns",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb/buildRuns"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/cfdc7a3b-0fdf-4463-a0e7-cf9067557beb"
            }
        },
        {
            "type": "ciProducts",
            "id": "00c99dd4-fb26-41e7-9aa0-18859cf6d2f7",
            "attributes": {
                "name": "My Product 4",
                "createdDate": "2021-08-17T18:11:04.614927Z",
                "productType": "APP"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/app"
                    }
                },
                "workflows": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/workflows",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/workflows"
                    }
                },
                "buildRuns": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/relationships/buildRuns",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7/buildRuns"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/00c99dd4-fb26-41e7-9aa0-18859cf6d2f7"
            }
        },
        {
            "type": "ciProducts",
            "id": "9501b490-307c-46a5-abee-83ae612a7caf",
            "attributes": {
                "name": "My Product 3",
                "createdDate": "2021-08-17T18:11:04.613099Z",
                "productType": "APP"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/app"
                    }
                },
                "workflows": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/workflows",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/workflows"
                    }
                },
                "buildRuns": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/relationships/buildRuns",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf/buildRuns"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/9501b490-307c-46a5-abee-83ae612a7caf"
            }
        },
        {
            "type": "ciProducts",
            "id": "d529e42c-f19a-4552-be11-6d74d6211872",
            "attributes": {
                "name": "My Product 2",
                "createdDate": "2021-08-17T18:11:04.611258Z",
                "productType": "APP"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/app"
                    }
                },
                "workflows": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/workflows",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/workflows"
                    }
                },
                "buildRuns": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/relationships/buildRuns",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872/buildRuns"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/d529e42c-f19a-4552-be11-6d74d6211872"
            }
        },
        {
            "type": "ciProducts",
            "id": "986a7c7a-a336-4b29-b4ba-de7d3b396be9",
            "attributes": {
                "name": "My Product 1",
                "createdDate": "2021-08-17T18:11:04.609109Z",
                "productType": "APP"
            },
            "relationships": {
                "app": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/app",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/app"
                    }
                },
                "workflows": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/workflows",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/workflows"
                    }
                },
                "buildRuns": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/relationships/buildRuns",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9/buildRuns"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciProducts/986a7c7a-a336-4b29-b4ba-de7d3b396be9"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciProducts?limit=10&sort=latestBuildCreatedDate"
    },
    "meta": {
        "paging": {
            "total": 5,
            "limit": 10
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)