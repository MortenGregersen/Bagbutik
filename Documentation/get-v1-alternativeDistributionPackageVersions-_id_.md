<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageVersions-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionPackageVersions-{}"
  },
  "title" : "Read Information for an Alternative Distribution Package Version"
}
-->

# Read Information for an Alternative Distribution Package Version

Get detail information about a specific alternative distribution package version.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b
```

**Response:**

```json
{
  "data": {
    "type": "alternativeDistributionPackageVersions",
    "id": "d1663e24-4360-4f7f-a661-8e616e3b3c3b",
    "attributes": {
      "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/0f/8a/35/0f8a3516-32b0-2f72-86be-733c19d4feea/alternative-distribution-package.zip?accessKey=1711772539_4058138271381390069_MNqOb5cg54HQ8yX%2B%2B2Vdqr2zloVZc%2FhvKpOKC2aMcu2ktV%2BhmRoZquZJg%2BHbxrjbnRRSoqNuLQ07Y59co1q4YT2k8ikLRfUL8ZOjB6SZ4s4W3hfIquIZ6WQNoGHQ4YUwb1xVqAkNzgjgVVjp6Z41Cvuw0dyWtAQr9eJ1Q2tRd%2F5soBjsEiWWmkGI%2BZx2ByMkj5qlk9HXY%2BIkoU2XC9kQO6RyTR1YHv1JdHrw%2FNRj%2FvY%3D",
      "urlExpirationDate": "2024-03-29T21:22:19-07:00",
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
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageVersions/d1663e24-4360-4f7f-a661-8e616e3b3c3b"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)