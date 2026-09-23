<!--
{
  "availability" : [
    "App Store Connect API: 1.2.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/GET-v1-builds-_id_-diagnosticSignatures",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:get:v1-builds-{}-diagnosticSignatures"
  },
  "title" : "List all diagnostic signatures for a build"
}
-->

# List all diagnostic signatures for a build

List the aggregate backtrace signatures captured for a specific build.

## Discussion

The example below requests the top two weighted disk write diagnostic signatures. The example response returns two signatures that are responsible for 85% and 7% of disk writes.

### Example Request and Response

**Request:**

```
GET https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?filter[diagnosticType]=DISK_WRITES&limit=2
```

**Response:**

```json
{
  "data": [
    {
      "type": "diagnosticSignatures",
      "id": "35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd",
      "attributes": {
        "diagnosticType": "DISK_WRITES",
        "signature": "ExampleApp: -[DatabaseConnection executeSQL:enumerateRowsWithBlock:] + 23",
        "weight": 0.85
      },
      "relationships": {
        "logs": {
          "links": {
            "related": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd/logs"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/35fd8da9ea3dd8d2a64cb3d458fa59b2b41e66115f7ca5fa34df25a9419c5216dd"
      }
    },
    {
      "type": "diagnosticSignatures",
      "id": "351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7",
      "attributes": {
        "diagnosticType": "DISK_WRITES",
        "signature": "ExampleApp: -[TemporaryFile appendData:] + 100",
        "weight": 0.07
      },
      "relationships": {
        "logs": {
          "links": {
            "related": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7/logs"
          }
        }
      },
      "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/diagnosticSignatures/351c486f96912d7520ef0ceea8efe19aca98f41e3b111a77e64f6923d6eba0e2c7"
      }
    }
  ],
  "links": {
    "self": "https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?limit=3&filter%5BdiagnosticType%5D=DISK_WRITES",
    "next": "https://api.appstoreconnect.apple.com/v1/builds/1a254ec1-8e3d-48e7-bbd6-6b9a30072b29/diagnosticSignatures?cursor=Aw.AOYOFlQ&limit=3&filter%5BdiagnosticType%5D=DISK_WRITES"
  },
  "meta": {
    "paging": {
      "total": 4,
      "limit": 2
    }
  }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)