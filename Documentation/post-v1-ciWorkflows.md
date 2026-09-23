<!--
{
  "availability" : [
    "App Store Connect API: 1.5.0 -"
  ],
  "documentType" : "symbol",
  "framework" : "AppStoreConnectAPI",
  "identifier" : "/documentation/AppStoreConnectAPI/POST-v1-ciWorkflows",
  "metadataVersion" : "0.1.0",
  "role" : "Web Service Endpoint",
  "symbol" : {
    "kind" : "Web Service Endpoint",
    "modules" : [
      "App Store Connect API"
    ],
    "preciseIdentifier" : "rest:app_store_connect_api:post:v1-ciWorkflows"
  },
  "title" : "Create a workflow"
}
-->

# Create a workflow

Create a new Xcode Cloud workflow for an Xcode Cloud product.

## Discussion

The example request below creates a new workflow that performs the archive action. App Store Connect returns the `201` HTTP status code to indicate the successful creation of the workflow and returns information about the workflow. Use the data to access additional information or to start a new build.

### Example Request and Response

**Request:**

```
{    
“data”: {
        “type”: “ciWorkflows”,
        “attributes”: {
            “name”: “A new workflow”,
            “description”: “A new workflow that verifies my changes.”,
            “branchStartCondition”: {
                “source”: {
                    “isAllMatch”: false,
                    “patterns”: [
                        {
                            “pattern”: “main”,
                            “isPrefix”: false
                        }
                    ]
                },
                “filesAndFoldersRule”: {
                    “mode”: “START_IF_ANY_FILE_MATCHES”,
                    “matchers”: []
                },
                “autoCancel”: true
            },
            “actions”: [
                {
                    “name”: “Archive iOS”,
                    “actionType”: “ARCHIVE”,
                    “scheme”: “MyApp”,
                    “platform”: “IOS”,
                    “isRequiredToPass”: true
                }
            ],
            “isEnabled”: true,
            “isLockedForEditing”: false,
            “clean”: false,
            “containerFilePath”: “MyXcodeProject.xcodeproj”
        },
        “relationships”: {
            “xcodeVersion”: {
                “data”: {
                    “type”: “ciXcodeVersions”,
                    “id”: “Xcode12E507:stable”
                }
            },
            “macOsVersion”: {
                “data”: {
                    “type”: “ciMacOsVersions”,
                    “id”: “20G95”
                }
            },
            “product”: {
                “data”: {
                    “type”: “ciProducts”,
                    “id”: “8ca28eb1-2948-4848-813b-07c500665157”
                }
            },
            “repository”: {
                “data”: {
                    “type”: “scmRepositories”,
                    “id”: “195430ae-7262-4b24-abd2-cbb6891feab8”
                }
            }
        }
    }
}
```

**Response:**

```json
{
    "data": {
        "type": "ciWorkflows",
        "id": "f445a31a-b0c6-4a83-b295-25496f50a69e",
        "attributes": {
            "name": "A new workflow",
            "description": "A new workflow that verifies my changes.",
            "branchStartCondition": {
                "source": {
                    "isAllMatch": false,
                    "patterns": [
                        {
                            "pattern": "main",
                            "isPrefix": false
                        }
                    ]
                },
                "filesAndFoldersRule": {
                    "mode": "START_IF_ANY_FILE_MATCHES",
                    "matchers": []
                },
                "autoCancel": true
            },
            "tagStartCondition": null,
            "pullRequestStartCondition": null,
            "scheduledStartCondition": null,
            "actions": [
                {
                    "name": "Archive iOS",
                    "actionType": "ARCHIVE",
                    "destination": null,
                    "buildDistributionAudience": null,
                    "testConfiguration": null,
                    "scheme": "MyApp",
                    "platform": "IOS",
                    "isRequiredToPass": true
                }
            ],
            "isEnabled": true,
            "isLockedForEditing": false,
            "clean": false,
            "containerFilePath": "MyXcodeProject.xcodeproj",
            "lastModifiedDate": null
        },
        "relationships": {
            "repository": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/f445a31a-b0c6-4a83-b295-25496f50a69e/relationships/repository",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/f445a31a-b0c6-4a83-b295-25496f50a69e/repository"
                }
            },
            "buildRuns": {
                "links": {
                    "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/f445a31a-b0c6-4a83-b295-25496f50a69e/relationships/buildRuns",
                    "related": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/f445a31a-b0c6-4a83-b295-25496f50a69e/buildRuns"
                }
            }
        },
        "links": {
            "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows/f445a31a-b0c6-4a83-b295-25496f50a69e"
        }
    },
    "links": {
        "self": "https://api.appstoreconnect.apple.com/v1/ciWorkflows"
    }
}
```

---

Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)