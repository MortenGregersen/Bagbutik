<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackages-_id_-versions",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionPackages-{}-versions"
  },
  "title" : "Read Version Information for an Alternative Distribution Package"
}
-->

# Read Version Information for an Alternative Distribution Package

Get version detail information about a specific alternative distribution package.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb/versions
```

**Response:**

```json
{
  "data": [
    {
      "type": "alternativeDistributionPackageVersions",
      "id": "d1663e24-4360-4f7f-a661-8e616e3b3c3b",
      "attributes": {
        "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/0f/8a/35/0f8a3516-32b0-2f72-86be-733c19d4feea/alternative-distribution-package.zip?accessKey=1711771761_1717860025327843395_oB%2B2%2Byn1erOvfVXfBIpIIPCgXnTiWMKVVgUYXQQ47LvEaartEJzuzMGd0YTc%2Bj8I0hv%2BAbs9mxSDNwPAUaZo2Y87710jMkxjdSeU7RmVU%2FDxFd14QumlGQiNwMBtuFntiagJpz2oZ1m7JoKTpkKkkIfL2wdlLYGvo8rElWc7F0uz%2B8NjVBbniKXxiLCkCFfUavdvw%2FPi6IY4MxVP8lg0tfWJP9haaemTO4Db%2BevBzH0%3D",
        "urlExpirationDate": "2024-03-29T21:09:21-07:00",
        "version": "1",
        "state": "COMPLETED"
      },
      "relationships": {
        "variants": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/relationships/variants",
            "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/variants"
          }
        },
        "deltas": {
          "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/relationships/deltas",
            "related": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b/deltas"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackages/e651dbc7-a7a7-4e84-a1ae-2afcd92ec6cb/versions"
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