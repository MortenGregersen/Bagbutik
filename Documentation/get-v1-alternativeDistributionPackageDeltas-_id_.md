<!--
{
  "availability" : [
    "App Store Connect API: 3.3.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-alternativeDistributionPackageDeltas-_id_",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-alternativeDistributionPackageDeltas-{}"
  },
  "title" : "Read Information for Alternative Distribution Package Deltas"
}
-->

# Read Information for Alternative Distribution Package Deltas

Get detail information about specific alternative distribution package deltas.

## Discussion

### Example Request and Response

**Request:**

```
https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/9d53ac02-f669-4bf7-baff-019a17f33ee9
```

**Response:**

```json
{
  "data": {
    "type": "alternativeDistributionPackageDeltas",
    "id": "9d53ac02-f669-4bf7-baff-019a17f33ee9",
    "attributes": {
      "url": "https://iosapps.itunes.apple.com/itunes-assets/SWDistributionArtifacts123/v4/f0/29/7d/f0297daa-4377-87b4-dfca-41846325ae48/mzpse.7668245576990498917.ipa?accessKey=1711772747_147132452048240218_jSIsjjHrkRQIgmo%2F8a0J6OTcn2K6Jl5wb5h71ZoqrTBCnFKSzX8wii4v1VVWsSQZlyDFMATURL8Zm04Hdv31kgf%2BAR%2Bhq%2BzcRmexyaAqDSdZSmQQvZ7SWyH9ivd%2BezlIEKbTgH5F9YYOO4V0dbYA30rBJ1J3LA8yNd67jdEAy1hr2eZwbXF25GhANelme6vh%2BEMAEOLhwp1vWUiCp9jPdg%3D%3D",
      "urlExpirationDate": "2024-03-29T21:25:47-07:00",
      "alternativeDistributionKeyBlob": "Z1HWrJd3AAAABAAAAAFUYH7ql3cAAAAEAAAAAfaWTj6EhQAAAAgxqRGW+Q0aIlvEfIGEhQAAAAgAAAAAZbrpdWGqs9GEhQAAAAgAAAACgAlM7EDAqpNQ2wAAABCdGnX0xvGnc29EV8bdzyI2jmtHAlDbAAAA0JheOha/VKuUFUIf/aTUM4YZ3lk9zuzoi1BOQ/iUG92gaalZwmTpExJ/ABFF5sV6/z02U5JgfyESnJQcGVRwsi7FMxgv8gnqakMOJD6PRPFMlJ3Yhnm4o1SG844TSHY+qFVQ4kmle+aWmMF/RXOoKwtX41Jt01Q1Js+rG7aAUrwSsZO8Sghm/XzFC5R37qqC18hmFPyqcsuGAAj+P/ZnYf4uNgCc1purbwMNRH/yLnp4wMO2ftpLbli2I6Y2md/N5s0URFxqCQSUZAG74zbf/20xOKXMUNsAAAAQhERpq5CkvNJrNdG2N6aILnZf7XBQ2wAAABCPaQxLtryi+lWeC50vE915JJC4HVDbAAAAENXtlKBSfDy8j4ovmgpsQqZo1KUAUNsAAABQDmaElYX7GUcHt/K3BAOd6bmXznNEZCv82yiwJI28WSXyAJi8KsHicnBJz29VBvpdhYvAo3pXXNOU2mBVcjB5ygMV3+zEsPzygYbIe9M7W1kHUZI1UNsAAAAgSAr3kNEBH1SjzTjuKvzge7BwD8rBX5gTdh4oSpz2JlMAAAAAUNsAAAAOAAAAAAAAAAAAAAAAAAA="
    },
    "links": {
      "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/9d53ac02-f669-4bf7-baff-019a17f33ee9"
    }
  },
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/alternativeDistributionPackageDeltas/9d53ac02-f669-4bf7-baff-019a17f33ee9"
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)