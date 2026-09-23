<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-ciXcodeVersions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-ciXcodeVersions"
  },
  "title" : "List all xcode versions available in xcode cloud"
}
-->

# List all xcode versions available in xcode cloud

List all Xcode versions that are available to Xcode Cloud workflows.

## Discussion

The example request below lists Xcode versions available to Xcode Cloud workflows and supported test destinations, including information about available simulated devices. Use the data provided in the response to display available Xcode versions and test destinations on a dashboard or to read additional information; for example, macOS version information.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/ciXcodeVersions
```

**Response:**

```json
{
    "data": [
        {
            "type": "ciXcodeVersions",
            "id": "Xcode12E507:stable",
            "attributes": {
                "version": "Xcode12E507:stable",
                "name": "Xcode 12.5.1 (12E507)",
                "testDestinations": [
                    {
                        "deviceTypeName": "iPhone 8",
                        "deviceTypeIdentifier": "com.apple.CoreSimulator.SimDeviceType.iPhone-8",
                        "availableRuntimes": [
                            {
                                "runtimeName": "iOS 13.0",
                                "runtimeIdentifier": "com.apple.CoreSimulator.SimRuntime.iOS-13-0"
                            }
                        ],
                        "kind": "SIMULATOR"
                    },
                    {
                        "deviceTypeName": "Mac",
                        "deviceTypeIdentifier": "mac",
                        "availableRuntimes": [
                            {
                                "runtimeName": "Same as Selected macOS Version",
                                "runtimeIdentifier": "builder"
                            },
                            {
                                "runtimeName": "Latest Beta or Release (Currently macOS Big Sur 11.5.2 (20G95))",
                                "runtimeIdentifier": "latest:all"
                            },
                            {
                                "runtimeName": "macOS Big Sur 11.5.2 (20G95)",
                                "runtimeIdentifier": "20G95"
                            }
                        ],
                        "kind": "MAC"
                    },
                    {
                        "deviceTypeName": "Mac (Mac Catalyst)",
                        "deviceTypeIdentifier": "mac_catalyst",
                        "availableRuntimes": [
                            {
                                "runtimeName": "Same as Selected macOS Version",
                                "runtimeIdentifier": "builder"
                            },
                            {
                                "runtimeName": "Latest Beta or Release (Currently macOS Big Sur 11.5.2 (20G95))",
                                "runtimeIdentifier": "latest:all"
                            },
                            {
                                "runtimeName": "macOS Big Sur 11.5.2 (20G95)",
                                "runtimeIdentifier": "20G95"
                            }
                        ],
                        "kind": "MAC"
                    }
                ]
            },
            "relationships": {
                "macOsVersions": {
                    "links": {
                        "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable/relationships/macOsVersions",
                        "related": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode12E507:stable/macOsVersions"
                    }
                }
            },
            "links": {
                "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions/Xcode20G95:stable"
            }
        }
    ],
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciXcodeVersions"
    },
    "meta": {
        "paging": {
            "total": 1,
            "limit": 50
        }
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)